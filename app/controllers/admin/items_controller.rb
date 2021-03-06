class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item =Item.new(item_params)
    if@item.save
    redirect_to admin_item_path(@item)
    else
    @genres = Genre.all
    render :new
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
     @item = Item.find(params[:id])
     if@item.update(item_params)
     redirect_to admin_item_path(@item)
     else
     render :edit
     end
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name,:image_id,:introduction,:price,:is_active,:create_at,:update_at)
  end
end
