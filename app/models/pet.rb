class Pet < ApplicationRecord
  has_many :pet_photos
  has_many :pet_videos
  has_many :favorites
  has_many :dm_rooms
end
