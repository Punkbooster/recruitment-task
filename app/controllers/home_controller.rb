class HomeController < ApplicationController
  def index
    @products = if query_params
                  Product.search(query_params)
                else
                  Product.includes(:genres, :label)
                end
  end

  private

  def query_params
    params.permit(:q)[:q]
  end
end
