class UserController < ApplicationController

  logger.debug "Hola #{current_user.rol}"
  
end
