class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer "category_id"
      t.string "title"
      t.string "name"
      t.text "body"
      t.integer "location"
      t.timestamps
    end
  end
end
