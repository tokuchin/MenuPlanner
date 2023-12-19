class Comment < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  
  belongs_to :user
  belongs_to :recipe, optional: true
  belongs_to :menu, optional: true
  
  validate :validate_either_recipe_or_menu_present

  private

  def validate_either_recipe_or_menu_present
    if recipe_id.blank? && menu_id.blank?
      errors.add(:base, "recipe_id または menu_id のいずれか一方が必要です")
    elsif recipe_id.present? && menu_id.present?
      errors.add(:base, "recipe_id と menu_id は同時に指定できません")
    end
  end
  
end
