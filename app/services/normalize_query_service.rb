class NormalizeQueryService
  def initialize(query)
    @query = query
  end

  def call
    normalize_query
  end

  private

  def normalize_query
    @query.split(' ').map do |query_element|
      if query_element.include?(':')
        association_name, value = query_element.split(':')

        { association_name: association_name.to_sym, query_value: value }
      else
        { association_name: :product, query_value: query_element }
      end
    end
  end
end
