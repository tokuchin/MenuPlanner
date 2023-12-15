class Menu < ApplicationRecord
  validates :user_id, presence: true
  validates :recipe_id, presence: true
  validates :date, presence: true 
  
  belongs_to :user
  belongs_to :recipe
end
