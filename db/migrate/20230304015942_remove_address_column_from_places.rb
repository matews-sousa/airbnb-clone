class RemoveAddressColumnFromPlaces < ActiveRecord::Migration[7.0]
  def change
    remove_column :places, :address, :string
  end
end
