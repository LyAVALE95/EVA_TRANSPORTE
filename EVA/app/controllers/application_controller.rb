class ApplicationController < ActionController::Base

  respond_to :html, :json
   protect_from_forgery with: :null_session
  acts_as_token_authentication_handler_for User, fallback_to_devise: false

before_action :set_admin

def set_admin
  if current_user 
   @mycompany = Company.where("id = ?",current_user.company_id).first
   @mylocations = Location.where("company_id = ?",current_user.company_id)
   @myclientContacts = Clientcontact.joins(' inner join customers')
    .where('customers.id=?',params[:id] )
     @mylicenses = License.where("company_id = ?",current_user.company_id)
     @myrateExpenses = RateExpense.where("company_id = ?",current_user.company_id)
     @mystates = State.where("company_id = ?",current_user.company_id)
      @myclients = Customer.where("company_id = ?",current_user.company_id)
        @mypeScaffold = TypeScaffold.where("company_id = ?",current_user.company_id)
        @mywarehouses = Warehouse.where("company_id = ?",current_user.company_id)
         @myloads = Load.where("company_id = ? AND active = true",current_user.company_id)
          @mydrivers = Driver.where("company_id = ? AND active = true",current_user.company_id)
         @mytrucks = Truck.where("company_id = ? AND active = true",current_user.company_id)

 else
    @mycompany = ""
 end
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


