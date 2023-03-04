class AddPlaceInfoFieldsToPlaces < ActiveRecord::Migration[7.0]
  def change
    add_column :places, :max_guests, :integer
    add_column :places, :rooms, :integer
    add_column :places, :beds, :integer
    add_column :places, :baths, :integer
    add_column :places, :min_reservation_days, :integer
  end
end
