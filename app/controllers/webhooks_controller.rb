class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
      signing_secret = Rails.env.production? ?
                       Rails.application.credentials.dig(:stripe, :webhook_secret_account_production) :
                       Rails.application.credentials.dig(:stripe, :webhook_secret_development)
      event = Stripe::Webhook.construct_event(
        payload, sig_header, signing_secret
      )
    rescue JSON::ParserError => e
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      puts "Signature error"
      p e
      return
    end

    # Handle the event
    case event.type
    when 'checkout.session.completed'
      session = event.data.object
      reservation = Reservation.find_by(checkout_session_id: session.id)
      reservation.update(status: :paid)
      ReservationMailer.with(reservation: reservation).confirm.deliver_later
      ReservationMailer.with(reservation: reservation).confirm_host.deliver_later
    end

    render json: { message: 'success' }
  end

  def connect
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
      signing_secret = Rails.env.production? ?
                       Rails.application.credentials.dig(:stripe, :webhook_secret_connect_production) :
                       Rails.application.credentials.dig(:stripe, :webhook_secret_development)
      event = Stripe::Webhook.construct_event(
        payload, sig_header, signing_secret
      )
    rescue JSON::ParserError => e
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      puts "Signature error"
      p e
      return
    end

    # Handle the event
    case event.type
    when 'account.updated'
      account = event.data.object
      user = User.find_by(stripe_account_id: account.id)
      user.update(is_host: account.charges_enabled, charges_enabled: account.charges_enabled)
    end

    render json: { message: 'success' }
  end
end