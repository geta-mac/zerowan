class Reaction < ApplicationRecord
  belongs_to :to_user, class_name: "User"
  belongs_to :to_pet, class_name: "Pet"
  belongs_to :from_user, class_name: "User"

  enum status: { like: 0, dislike: 1 }
end
