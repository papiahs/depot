class StoreController < ApplicationController
  def index
    @prods = Product.all
  end

end
