class DmRoom < ApplicationRecord
  belongs_to :pet
  belongs_to :user
end
