class AddFieldToHome < ActiveRecord::Migration[7.0]
  def change
    add_column :homes, :location, :float
    
  end
end
