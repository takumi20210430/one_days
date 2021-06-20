class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.integer :user_id
      t.integer :dog_type_id
      t.text :image1_id
      t.text :image2_id
      t.text :image3_id
      t.string :name
      t.integer :age
      t.string :skill
      t.string :favorite
      t.text :introduction

      t.timestamps
    end
  end
end
