class Pet < ApplicationRecord
  belongs_to :user
  has_many :pet_photos
  has_many :pet_videos
  has_many :favorites
  has_many :dm_rooms

  # active_hashを使用して都道府県をプルダウン
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
