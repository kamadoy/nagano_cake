#frozen_string_literal: true
class Public::SessionsController < Devise::SessionsController
  #before_action :customer_state , only: [:create]
 # before_action :configure_permitted_parameters, if: :devise_controller?
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.

  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  #def after_sign_out_path_for(resource)
   # about_path
#  end

 # protected

#  def configure_permitted_parameters
#    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:adress,:telephone_number])
#  end
end