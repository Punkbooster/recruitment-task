class ProductsQuery
  def initialize(query)
    @query = query
  end

  def all
    perform_queries
  end

  private

  def perform_queries
    association_query_pairs.inject(Product.all) do |result, element|
      ::ProductsSearchService.new(
        association_name: element[:association_name],
        query_value: element[:query_value],
        relation: result
      ).call
    end
  end

  def association_query_pairs
    NormalizeQueryService.new(@query).call
  end
end
