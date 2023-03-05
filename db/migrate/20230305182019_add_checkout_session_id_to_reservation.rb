class AddCheckoutSessionIdToReservation < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :checkout_session_id, :string
  end
end
