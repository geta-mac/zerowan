class CreatePetPhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :pet_photos do |t|
      t.integer :pet_id
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
