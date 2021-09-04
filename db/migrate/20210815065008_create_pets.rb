class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :age
      t.boolean :castration
      t.string :category
      t.string :character
      t.integer :avairable_area
      t.integer :animal_type
      t.text :description
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :image4
      t.string :video
      t.integer :gender

      t.timestamps
    end
  end
end
