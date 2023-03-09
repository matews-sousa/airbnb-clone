class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  # POST /reservations
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
        success_url: reservation_url(@reservation),
        cancel_url: reservation_url(@reservation),
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

  # POST /reservations/:id/refund
  def refund
    @reservation = Reservation.find(params[:id])
    
    if @reservation.refundable?
      checkout_session = Stripe::Checkout::Session.retrieve(@reservation.checkout_session_id)
      refund = Stripe::Refund.create({
        payment_intent: checkout_session.payment_intent,
      })
      @reservation.update(status: :refunded)
      redirect_to reservation_path(@reservation)
    else
      redirect_to reservation_path(@reservation)
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:checkin, :checkout, :guests, :place_id)
  end
end
