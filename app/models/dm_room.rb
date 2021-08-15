class DmRoom < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  has_many :direct_messages
end
