class AddHostReferenceAndCleaningFeeToPlaces < ActiveRecord::Migration[7.0]
  def change
    add_reference :places, :host, null: false, foreign_key: { to_table: :users }
    add_column :places, :cleaning_fee, :decimal
  end
end
