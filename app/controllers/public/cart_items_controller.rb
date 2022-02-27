class Public::CartItemsController < ApplicationController
  def index
  end

  def update
    @cart_item = Cart_item.find(params[:id])
     @cart_item.update(cart_item_params)
     redirect_to cart_items_path
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:customer_id,:amount,:create_at,:update_at)
  end
end
