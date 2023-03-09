class ReservationMailer < ApplicationMailer
  def confirm(reservation)
    @reservation = reservation
    mail(to: @reservation.user.email, subject: 'Reservation Confirmation')
  end

  def cancel(reservation)
    @reservation = reservation
    mail(to: @reservation.user.email, subject: 'Reservation Canceled')
  end

  def confirm_host(reservation)
    @reservation = reservation
    mail(to: @reservation.place.host.email, subject: 'Reservation Confirmation')
  end
end
