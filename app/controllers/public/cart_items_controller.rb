class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items

    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end
  def create
     @cart_item = CartItem.new(cart_item_params)
     @cart_item.customer_id = current_customer.id
     if  current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
       #@cart_item.customer_id = current_customer.id
       @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])

    #   redirect_to action: :update id: (params[:cart_item][:item_id])
        @cart_item.amount += params[:cart_item][:amount].to_i
        @cart_item.save

       redirect_to cart_items_path

     elsif@cart_item.save
     redirect_to cart_items_path
     else
     @cart_items = current_customer.cart_items
     render :index

     end

  end

  def update
    @cart_item = CartItem.find(params[:id])
     @cart_item.update(cart_item_params)
     redirect_to cart_items_path
  end

  def destroy_all
   @cart_items = current_customer.cart_items
   @cart_items.destroy_all
    redirect_to items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end



  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:customer_id,:amount,:create_at,:update_at,:adress_id)
  end
end
