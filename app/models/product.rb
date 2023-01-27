class Product < ApplicationRecord
  has_many :category_links, class_name: 'TagLink', as: :target, dependent: :destroy
  has_many :categories, through: :category_links, class_name: 'Tag', source: :tag
  has_many :ingredients, dependent: :delete_all

  validates :name, presence: true

  scope :ordered, ->{ order(name: :asc) }
end
