class ApplicationController < ActionController::Base

  respond_to :html, :json
   protect_from_forgery with: :null_session
  acts_as_token_authentication_handler_for User, fallback_to_devise: false

before_action :set_admin
def set_admin
   @mycompany = Company.where("id = ?",current_user.company_id).first
end
  protected
def index

end
def set_current_user
      User.current = current_user
     mycompany = Company.where("id = ?",current_user.company_id).first                       
    end
    def configure_permitted_parameters
    #added_attrs = [:name,:last_name, :email, :password, :password_confirmation, :remember_me]
    #devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    #devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :rol, :description, :birthday, :hireDate, :section, :category, :RFC, :address, :district, :intnum, :extnum, :state, :zipcode, :country, :tel, :telMov, :schedule, :note, :email, :password)}
    end
end


