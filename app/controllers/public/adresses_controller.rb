class Public::AdressesController < ApplicationController
  def index
    @adress = Adress.new
    @adresses = Adress.all
  end

  def edit
    @adress = Adress.find(params[:id])
  end

  def update
     @adress = Adress.find(params[:id])
     @adress.update(adress_params)
     redirect_to adresses_path
  end

  def create
    @adress = Adress.new(adress_params)
    @adress.save

    redirect_to adresses_path
  end

  def destroy
   @adress = Adress.find(params[:id])
   @adress.destroy
   redirect_to adresses_path
  end

   private

  def adress_params
    params.require(:adress).permit(:customer_id, :name,:postal_code,:adress,:create_at,:update_at)
  end
end
