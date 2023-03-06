class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      session = Stripe::Checkout::Session.create({
        mode: 'payment',
        line_items: [{
          name: @reservation.place.name,
          amount: (100 * @reservation.total_price).to_i,
          currency: 'usd',
          quantity: 1
        }],
        customer: @reservation.user.stripe_customer_id,
        success_url: reservations_success_url(@reservation) + "?session_id={CHECKOUT_SESSION_ID}",
        cancel_url: reservations_cancel_url(@reservation) + "?session_id={CHECKOUT_SESSION_ID}",
        payment_intent_data: {
          application_fee_amount: (100 * @reservation.total_price * 0.1).to_i,
          transfer_data: {
            destination: @reservation.place.host.stripe_account_id
          },
          metadata: {
            reservation_id: @reservation.id,
          }
        }
      })

      @reservation.update(checkout_session_id: session.id)
      redirect_to session.url, allow_other_host: true
    else
      redirect_to place_path(@reservation.place), notice: "Error"
    end
  end

  def success
    reservation = Reservation.find_by(checkout_session_id: params[:session_id])
    reservation.update(status: :paid)
  end

  def cancel
    reservation = Reservation.find_by(checkout_session_id: params[:session_id])
    reservation.update(status: :canceled)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:checkin, :checkout, :guests, :place_id)
  end
end
