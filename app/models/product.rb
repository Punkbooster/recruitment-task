class Product < ApplicationRecord
  belongs_to :label, inverse_of: :products

  has_many :product_genre
  has_many :genres, through: :product_genres

  validates :title, :price, :released_at, presence: true
end
