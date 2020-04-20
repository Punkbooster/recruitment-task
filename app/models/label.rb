class Label < ApplicationRecord
  has_many :products, inverse_of: :label, dependant: :destroy

  validates :name, presence: true, uniqueness: true
end
