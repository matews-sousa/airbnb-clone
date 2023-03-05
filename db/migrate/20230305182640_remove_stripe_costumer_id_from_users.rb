class RemoveStripeCostumerIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :stripe_costumer_id, :string
  end
end
