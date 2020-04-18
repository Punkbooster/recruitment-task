class Label < ApplicationRecord
  has_many :products, inverse_of: :label

  validates :name, :description, presence: true
end
