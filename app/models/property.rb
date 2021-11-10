class Property < ApplicationRecord
  # validations
  validates :operation_type, presence: true
  validates :address, presence: true, uniqueness: true
  validates :property_type, presence: true
  validates :status, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :maintenance, numericality: { greater_than_or_equal: 0 }
  validates :area, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { maximum: 140 }

  # enum
  enum operation_type: { rent: 0, sale: 1 }
  enum property_type: { aparment: 0, house: 1 }
  enum status: { active: 0, closed: 1 }

  # associations
  belongs_to :user, -> { where role: 1 }, inverse_of: :properties
  has_many :favorites, dependent: :nullify
  has_many :contacts, dependent: :nullify
  has_many :did_favorite_users, through: :favorites, source: :user, dependent: :destroy
  has_many :did_contact_users, through: :contacts, source: :user, dependent: :destroy
  # attached
  # has_many_attached :images
end
