class Tag < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :tag_links, dependent: :delete_all

  validates :name, uniqueness: { scope: :author_id }, presence: true
  validates :color, format: { with: /\A#[0-9A-Fa-f]{6}\Z/ }

  scope :ordered, ->{ order(name: :desc) }
end
