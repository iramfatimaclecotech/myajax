class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :post_name
      t.string :post_details
      t.integer :user_id

      t.timestamps
    end
  end
end
