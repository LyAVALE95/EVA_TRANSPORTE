class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy]

  # GET /drivers
  # GET /drivers.json
  def index
    #@drivers = Driver.all
    @drivers = Driver.where("company_id = ?", current_user.company_id)
  end

  # GET /drivers/1
  # GET /drivers/1.json
  def show
    @driver = Driver.where("company_id = ? and id = ?", 
      current_user.company_id, params[:id]).first
      @truck = Truck.new(driver_id: '3', model: '555' )
    #@truck = Truck.new(driver_id: '3',company_id: current_user.company_id )
    #@truck.driver_id = @mydriver.id
    #@truck.company_id = current_user.company_id
    #@truck.save
    respond_to do |format|
      format.html
      format.json { render json: @driver.to_json(:include => {:trucks => { :only => [
        :driver_id => "3"
        ] } } )  }
    end
  end

  # GET /drivers/new
  def new
    @driver = Driver.new
  end

  # GET /drivers/1/edit
  def edit
  end

  # POST /drivers
  # POST /drivers.json
  def create
    @driver = Driver.new(driver_params)
       if current_user.company_id
         @driver.company_id = current_user.company_id
       end
    respond_to do |format|
      if @driver.save
        format.html { redirect_to @driver, notice: 'Driver was successfully created.' }
        format.json { render :show, status: :created, location: @driver }
      else
        format.html { render :new }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drivers/1
  # PATCH/PUT /drivers/1.json
  def update
    respond_to do |format|
      if @driver.update(driver_params)
        format.html { redirect_to @driver, notice: 'Driver was successfully updated.' }
        format.json { render :show, status: :ok, location: @driver }
      else
        format.html { render :edit }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drivers/1
  # DELETE /drivers/1.json
  def destroy
    @driver.destroy
    respond_to do |format|
      format.html { redirect_to drivers_url, notice: 'Driver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      @driver = Driver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driver_params
    params.require(:driver).permit(:code, :department,:names,:lastnames, :rfc,:hiredDate,:user_id,:active )
    end
end
