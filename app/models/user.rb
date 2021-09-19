class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:trackable

  has_many :favorites, dependent: :destroy
  has_many :dm_rooms
  has_many :direct_messages, through: :dm_rooms
  has_many :pets
  has_many :reactions
  has_many :chat_room_users
  has_many :chat_rooms, through: :chat_room_users
  has_many :chat_message

end
