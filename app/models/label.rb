class Label < ApplicationRecord
  has_many :products, inverse_of: :label

  validates :name, presence: true, uniqueness: true
end
