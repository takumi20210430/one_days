class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.integer :dog_id
      t.string :title
      t.text :body
      t.text :image_id1
      t.text :image_id2
      t.text :image_id3
      t.text :image_id4
      t.text :image_id5

      t.timestamps
    end
  end
end
