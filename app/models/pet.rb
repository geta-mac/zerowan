class Pet < ApplicationRecord
  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader


  belongs_to :user, optional: true
  has_many :pet_photos
  has_many :pet_videos
  has_many :favorites, dependent: :destroy
  has_many :dm_rooms
  has_many :reactions

  # index,showの表示を数字ではなくオス、メスなどで表示
  enum gender: { オス:1,メス:2,その他:3,不明:4}
  enum animal_type: {
    選択してください:0,
    トイ・プードル:1,チワワ:2,ミックス犬:3,柴犬:4,ポメラニアン:5,
    ミニチュアダックスフンド:6,フレンチ・ブルドッグ:7,ヨークシャー・テリア:8,
    ミニチュア・シュナウザー:9,シー・ズー:10,雑種:11,それ以外:12
  }
  enum avairable_area:{
    "---":0,
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
    沖縄県:47
  }
  enum castration: {有り:1,無し:2,予定有り:3}
  enum category: {犬:1,猫:2,その他の生き物:3}
  enum age: {
    "~1ヶ月":1,"~3ヶ月":2,"~6ヶ月":3,"~1歳":4,"~1歳6ヶ月":5,"~2歳":6,"~3歳":7,"~4歳":8,
    "~5歳":9,"それ以上":10
  }
  enum  character: { やんちゃ:1,大人しい:2}

end
