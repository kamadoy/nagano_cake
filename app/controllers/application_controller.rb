class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

 # def after_sign_out_path_for(resource)
   # about_path
  #end
    def after_inactive_sign_up_path_for(resource)
     customer_path(resource)
    end

    def after_sign_in_path_for(resource_or_scope)
      if resource.is_a?(Admin)
        admin_top_path
      else
        root_path
      end
    end

    # ログアウト後のリダイレクト先
    def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :admin
        new_admin_session_path
      else
        root_path
      end
    end
  #before_action :authenticate_customer!,if: :customer_auth?

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:adress,:telephone_number])
  end

  def customer_auth?
    unless (controller_name == 'items' && action_name == 'index')||(controller_name == 'items' && action_name == 'show')||(controller_name == 'homes' && action_name == 'top')||(controller_name == 'homes' && action_name == 'about')
      true
    end
  end

  #protected

  #def configure_permitted_parameters
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:adress,:telephone_number])
  #end
end
