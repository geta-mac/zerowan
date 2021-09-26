class CreatePetPhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :pet_photos do |t|
      t.references :pet, null: false, foreign_key: true
      t.binary :image, limit: 200.megabyte
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
