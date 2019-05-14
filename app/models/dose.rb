class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates :description, :cocktail, :ingredient, presence: true
  validates :cocktail_id, :uniqueness => { :scope => :ingredient_id }
end
