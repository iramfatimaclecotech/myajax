class AddFieldToCard < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :rating, :string
    add_column :cards, :stars, :string
  end
end
