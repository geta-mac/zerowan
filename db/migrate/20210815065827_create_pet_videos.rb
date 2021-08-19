class CreatePetVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :pet_videos do |t|
      t.references :pet, null: false, foreign_key: true
      t.binary :video, limit: 200.megabyte
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
