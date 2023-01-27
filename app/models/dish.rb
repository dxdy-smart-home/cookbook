class Dish < ApplicationRecord
  has_many :tag_links, as: :target, dependent: :destroy
  has_many :tags, through: :tag_links
  has_many :ingredients, dependent: :destroy

  accepts_nested_attributes_for :ingredients, allow_destroy: true

  validates :name, presence: true
  validates :servings_number, :cooking_time, numericality: { greater_than: 0 }
end
