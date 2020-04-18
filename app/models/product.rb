class Product < ApplicationRecord
  belongs_to :label, inverse_of: :products
  has_many :genres, inverse_of: :product

  validates :name, :description, :price, presence: true
end
