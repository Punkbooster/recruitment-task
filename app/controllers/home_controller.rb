class HomeController < ApplicationController
  def index
    @products = if query_params
                  ProductsQuery.new(query_params).all.includes(:genres, :label)
                else
                  Product.includes(:genres, :label)
                end
  end

  private

  def query_params
    params.permit(:q)[:q]
  end
end
