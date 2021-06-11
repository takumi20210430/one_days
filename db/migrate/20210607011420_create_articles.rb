class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.integer :dog_id
      t.string :title
      t.text :body
      t.text :image1_id
      t.text :image2_id
      t.text :image3_id
      t.text :image4_id
      t.text :image5_id

      t.timestamps
    end
  end
end
