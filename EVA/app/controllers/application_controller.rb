class ApplicationController < ActionController::Base

  respond_to :html, :json
   protect_from_forgery with: :null_session
  acts_as_token_authentication_handler_for User, fallback_to_devise: false
end
