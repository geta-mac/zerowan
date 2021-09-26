class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:trackable

  has_many :favorites, dependent: :destroy
  has_many :dm_rooms, dependent: :destroy
  has_many :direct_messages, through: :dm_rooms, dependent: :destroy
  has_many :pets, dependent: :destroy
  has_many :reactions, dependent: :destroy, foreign_key: :to_user_id
  has_many :chat_room_users
  has_many :chat_rooms, through: :chat_room_users
  has_many :chat_messages

end
