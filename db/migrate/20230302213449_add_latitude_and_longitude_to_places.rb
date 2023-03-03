class AddLatitudeAndLongitudeToPlaces < ActiveRecord::Migration[7.0]
  def change
    add_column :places, :latitude, :float
    add_column :places, :longitude, :float

    add_index :places, :latitude
    add_index :places, :longitude
  end
end
