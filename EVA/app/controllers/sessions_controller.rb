class SessionsController < Devise::SessionsController


def create
  #user = User.find_by_email(params[:email])
  #if user && user.authenticate(params[:password])
    #if params[:remember_me]
     # cookies.permanent[:auth_token] = user.auth_token
    #else
     # cookies[:auth_token] = user.auth_token
    #end
   # redirect_to root_url, :notice => "Logged in!"
  #else
    #flash.now.alert = "Invalid email or password"
   # render "new"
  #end
  respond_to do |format|
    format.html { super }
    format.json { sign_in_json }
  end

end

def destroy

  respond_to do |format|
    format.html { super }
    format.json { sign_out_json }
  end
end

private

def sign_in_json
# Fetch params
   email = params[:session][:email] if params[:session]
   password = params[:session][:password] if params[:session]

   id = User.find_by(email: email).try(:id) if email.presence

  # Validations
  if request.format != :json
    render status: 406, json: { message: 'The request must be JSON.' }
    return
  end

  if email.nil? or password.nil?
    render status: 400, json: { message: 'The request MUST contain the user email and password.' }
    return
  end

  # Authentication
  user = User.find_by(email: email)

  if user
    if user.valid_password? password
      #user.reset_authentication_token! hay que agregar validacion
      # Note that the data which should be returned depends heavily of the API client needs.
      render status: 200, json: { email: user.email, authentication_token: user.authentication_token,
        id: id , company_id: user.company_id ,rol: user.rol , name: user.name, last_name: user.lastName}

        #id: id , company_id: user.company_id ,rol: user.rol , name: user.name, lastName: user.lastName }

    else
      render status: 401, json: { message: 'Invalid email or password.' }
    end
  else
    render status: 401, json: { message: 'Invalid email or password.' }
  end
end

def sign_out_json
   # Fetch params
  user = User.find_by(authentication_token: params[:user_token])

  if user.nil?
    render status: 404, json: { message: 'Invalid token.' }
  else
    user.authentication_token = nil
    user.save!
    render status: 204, json: nil
  end
end


end
