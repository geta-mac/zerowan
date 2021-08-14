class AddVideoToPetVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :pet_videos, :video, :binary, limit: 200.megabyte
  end
end
