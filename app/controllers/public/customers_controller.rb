class Public::CustomersController < ApplicationController
  def show
     @customer = current_customer
  end

  def edit
     @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end

  def unsubsrib
  end

  def withdraw
    @customer = current_customer
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name,:last_name_kana, :first_name_kana,:emai,:encrypted_password,:postal_code,:adress,:telephone_number,:is_active,:create_at,:update_at)
  end
end
