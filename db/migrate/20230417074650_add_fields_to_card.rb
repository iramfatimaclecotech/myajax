class AddFieldsToCard < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :images, :string
  end
end
