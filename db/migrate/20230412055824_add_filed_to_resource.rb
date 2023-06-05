class AddFiledToResource < ActiveRecord::Migration[7.0]
  def change
    add_column :resources, :input, :string
  end
end
