class Genre < ApplicationRecord
  belongs_to :product, inverse_of: :genres

  validates :name, :description, presence: true
end
