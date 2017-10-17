class RegistrationsController < Devise::RegistrationsController
	def new
    build_resource({})
    self.resource.company = Company.new
    yield resource if block_given?
    respond_with self.resource
  end
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  private
  # Modified Devise params for user login
  def sign_up_params
    params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation ,:user_img,:company_id,
    company_attributes: [:name ,:city, :legalName , :rfcTaxId, :cpZip, :address, :number, :phoneNumber, :city, :state, :country, :email,:company_img ])
  end
end
