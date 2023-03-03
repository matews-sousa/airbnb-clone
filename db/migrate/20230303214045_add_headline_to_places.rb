class AddHeadlineToPlaces < ActiveRecord::Migration[7.0]
  def change
    add_column :places, :headline, :string
  end
end
