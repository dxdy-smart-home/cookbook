class Tag < ApplicationRecord
  has_many :tag_links, dependent: :delete_all

  validates :name, :context, presence: true
  validates :color, format: { with: /\A#[0-9A-Fa-f]{6}\Z/ }

  scope :ordered, ->{ order(name: :asc) }
  scope :dishes, ->{ where(context: :dish) }
  scope :categories, ->{ where(context: :category) }
end
