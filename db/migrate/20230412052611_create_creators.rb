class CreateCreators < ActiveRecord::Migration[7.0]
  def change
    create_table :creators do |t|
      t.string :name
      t.integer :resource_id

      t.timestamps
    end
  end
end
