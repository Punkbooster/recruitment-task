class HomeController < ApplicationController
  def index
    @products = Product.search(query_params)
  end

  private

  def query_params
    params.permit(:search_query)[:search_query]
  end
end
