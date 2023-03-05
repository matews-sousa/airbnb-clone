class AddStripeCostumerIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :stripe_costumer_id, :string
  end
end
