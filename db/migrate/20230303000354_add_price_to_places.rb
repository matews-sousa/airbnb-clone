class AddPriceToPlaces < ActiveRecord::Migration[7.0]
  def change
    add_column :places, :price, :decimal
  end
end
