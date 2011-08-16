class StoreController < ApplicationController
  def index
    @prods = Product.all
    @cart = current_cart
  end

end
