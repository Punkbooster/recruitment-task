class ProductsSearchService
  ASSOCIATION_SCOPE_NAME_PAIRS = {
    genre: :by_genre_name,
    label: :by_label_name,
    product: :by_title
  }.freeze

  def initialize(association_name:, query_value:, relation: Product.all)
    @association_name = association_name
    @query_value = query_value
    @relation = relation
  end

  def call
    return @relation if scope_name.nil? || @relation.empty?

    @relation.public_send(scope_name, @query_value)
  end

  private

  def scope_name
    @scope_name ||= ASSOCIATION_SCOPE_NAME_PAIRS[@association_name]
  end
end
