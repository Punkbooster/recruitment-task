class Product < ApplicationRecord
  belongs_to :label, inverse_of: :products

  has_many :product_genres
  has_many :genres, through: :product_genres

  validates :title, :price, :released_at, presence: true
  validates :title, uniqueness: true

  scope :by_genre_name, ->(query) { joins(:genres).where(genres: { name: query }) }
  scope :by_label_name, ->(query) { joins(:label).where(labels: { name: query }) }
  scope :by_title, ->(query) { where('title ilike ?', "%#{query}%") }

  def self.search(query)
    association_query_pairs = NormalizeQueryService.new(query).call

    association_query_pairs.inject(Product.all) do |result, element|
      ::ProductsSearchService.new(
        association_name: element[:association_name],
        query_value: element[:query_value],
        relation: result
      ).call
    end
  end
end
