class Cocktail < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates :name, uniqueness: true
  validates :name, presence: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
end
