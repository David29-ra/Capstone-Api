class User < ApplicationRecord
  attr_accessor :skip_password_validation

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validations
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true, format: { with: /9\d{8}/ }
  validates :name, presence: true, format: { with: /[a-zA-Z]+/ }
  validates :role, presence: true

  # enum
  enum role: { seeker: 0, landlord: 1 }

  # associations
  has_many :properties, dependent: :destroy
  has_many :favorites, dependent: :nullify
  has_many :contacts, dependent: :nullify
  has_many :favorited, through: :favorites, source: :property, dependent: :destroy
  has_many :contacted, through: :contacts, source: :property, dependent: :destroy

  # token
  has_secure_token
  has_secure_token :auth_token

  def invalidate_token
    update(token: nil)
  end

  private

  def password_required?
    return false if skip_password_validation

    super
  end
end
