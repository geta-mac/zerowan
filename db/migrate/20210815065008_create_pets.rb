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
      t.string :pic_id
      t.string :video_id

      t.timestamps
    end
  end
end
