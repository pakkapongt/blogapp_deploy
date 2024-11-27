class User < ApplicationRecord
  # Add devise modules you want (database_authenticatable, registerable, etc.)
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Associations
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes

end
