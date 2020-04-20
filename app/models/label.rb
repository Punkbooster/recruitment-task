class Label < ApplicationRecord
  has_many :products, inverse_of: :label, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
