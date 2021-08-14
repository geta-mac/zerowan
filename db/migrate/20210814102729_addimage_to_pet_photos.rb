class AddimageToPetPhotos < ActiveRecord::Migration[6.1]
  def change
    add_column :pet_photos, :image, :binary, limit: 200.megabyte
  end
end
