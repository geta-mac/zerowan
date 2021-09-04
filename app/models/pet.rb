class Pet < ApplicationRecord
  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader


  belongs_to :user
  has_many :pet_photos
  has_many :pet_videos
  has_many :favoritess
  has_many :dm_rooms

  # index,showの表示を数字ではなくオス、メスなどで表示
  # enum gender: { "オス": 1, "メス": 2, "その他": 3 , "不明": 4}

  # active_hashを使用して都道府県をプルダウン
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :pet_type
end
