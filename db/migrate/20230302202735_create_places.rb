class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :name
      t.text :description
      t.string :address

      t.timestamps
    end
  end
end
