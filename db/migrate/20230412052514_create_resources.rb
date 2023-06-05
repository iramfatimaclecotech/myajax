class CreateResources < ActiveRecord::Migration[7.0]
  def change
    create_table :resources do |t|
      t.string :tag_list
      t.string :title
      t.string :discription

      t.timestamps
    end
  end
end
