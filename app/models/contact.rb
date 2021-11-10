class Contact < ApplicationRecord
  # validations
  validates :user_id, uniqueness: { scope: :property_id }
  # associations
  belongs_to :user
  belongs_to :property
end
