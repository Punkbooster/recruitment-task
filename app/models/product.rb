class Product < ApplicationRecord
  belongs_to :label, inverse_of: :products

  has_many :product_genres
  has_many :genres, through: :product_genres

  validates :title, :price, :released_at, presence: true
  validates :title, uniqueness: true

  scope :by_genre_name, ->(query) { joins(:genres).where(genres: { name: query }) }
  scope :by_label_name, ->(query) { joins(:label).where(labels: { name: query }) }
  scope :by_title, ->(query) { where('title ilike ?', "%#{query}%") }
end
