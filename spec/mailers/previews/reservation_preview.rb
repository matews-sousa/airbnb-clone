# Preview all emails at http://localhost:3000/rails/mailers/reservation
class ReservationPreview < ActionMailer::Preview
  def confirm
    ReservationMailer.confirm(Reservation.first)
  end

  def cancel
    ReservationMailer.cancel(Reservation.first)
  end

  def confirm_host
    ReservationMailer.confirm_host(Reservation.first)
  end
end
