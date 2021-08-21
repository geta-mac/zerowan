class DmRoom < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  has_many :direct_messages
end
