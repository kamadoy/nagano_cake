class Public::OrderDatilesController < ApplicationController
  def create
     @cart_items = current_customer.cart_items
    @order_datile = OrderDatile.new
    @order_datile.save

  end
end
