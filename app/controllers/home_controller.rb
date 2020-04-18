class HomeController < ApplicationController

  def index
    @products = Product.all.includes(:label, :genres)
  end
end
