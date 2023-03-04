class AddPlaceLocationFieldsToPlaces < ActiveRecord::Migration[7.0]
  def change
    add_column :places, :address_1, :string
    add_column :places, :address_2, :string
    add_column :places, :postal_code, :string
  end
end
