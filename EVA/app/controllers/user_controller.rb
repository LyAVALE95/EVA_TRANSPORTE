class UserController < ApplicationController


   before_action :only => [:show,:new, :edit ,:delete] do

   redirect_to new_user_session_path unless current_user  && current_user.rol == "Transportista" || current_user.rol == "administrador"

  end


  # GET /users
  # GET /users.json
  def index
    @users = User.where("company_id = ?", current_user.company_id)
    @user = User.new
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def myuser
    @users = current_user
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    #@user = current_user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)  
      if current_user.company_id
        @user.company_id = current_user.company_id
  end
=begin    
    if params[:commit] == "Crear usuario"
        @user.company_id = current_user.company_id
    end
=end    
    respond_to do |format|
      if @user.save
        if @user.rol == 'Conductor'
          @driver = Driver.new
          @driver.names = @user.name
          @driver.lastnames = @user.lastName
            @driver.company_id = @user.company_id
             @driver.user_id = @user.id
          if @driver.save
          else
          end
        end
        if @user.rol == 'Cliente'
          @cliente = Customer.new
          @cliente.names = @user.name
          @cliente.lastnames = @user.lastName
            @cliente.company_id = @user.company_id
             @cliente.user_id = @user.id
          if @cliente.save
          else
          end
        end

        #@user.company_id = current_user.company_id
        format.html { redirect_to users_admin_index_url, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json

 
  def update_none
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_admin_index_url, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
  # @user = User.find(params[:id])
    @user = User.find(current_user.id)
    @user.update_attributes(user_params_up)
    @user.company_id = current_user.company_id
    if @user.errors.any?
      render :action => :myuser
    else
     #redirect_to my_account_details_path, :notice => 'Account details updated'
     #redirect_to @user, :notice => 'Account details updated'
     # render :action => :myuser
         #redirect_to users_url
      redirect_to "/users/myuser" #,:notice => 'Account details updated'
    end
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update(user_params_up)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to "/users/myuser.html.erb"
    else
      render "edit"
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_admin_index_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.permit(:name, :lastName,:rol, :description, :birthday, :hireDate, :section, :category, :RFC, :address, :district, :intnum, :extnum, :state, :zipcode, :country, :tel, :telMov, :schedule, :note, :email, :password,:company_id)
    end
      def user_params_up
      params.permit(:name, :last_name, :email, :rol,:company_attributes =>[:name, :legalName, :code, :tel, :active])
    end
  
end
