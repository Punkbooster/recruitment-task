class NormalizeQueryService
  def initialize(query)
    @query = query
  end

  def call
    normalize_query

    @result
  end

  private

  def normalize_query
    @result = []

    @query.split(' ').each do |query_element|
      if query_element.include?(':')
        association_name, value = query_element.split(':')

        @result << { association_name: association_name.to_sym, query_value: value }
      else
        @result << { association_name: :product, query_value: query_element }
      end
    end
  end
end
