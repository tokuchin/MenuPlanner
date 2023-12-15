class Recipe < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true 
  
  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
  has_many :menus
  
  mount_uploader :image, ImageUploader
end
