class CreatePost2s < ActiveRecord::Migration[7.0]
  def change
    create_table :post2s do |t|
      t.string :body
      t.string :title

      t.timestamps
    end
  end
end
