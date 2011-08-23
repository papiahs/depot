class StoreController < ApplicationController
  def index
    @prods = Product.all
    @cart = current_cart
    #Notifier.order_received().deliver
  end

end
