class CarrierLinesController < ApplicationController
  before_action :set_carrier_line, only: [:show, :edit, :update, :destroy]

  # GET /carrier_lines
  # GET /carrier_lines.json
  def index
    @carrier_lines = CarrierLine.where("company_id = ?", current_user.company_id)
  end

  # GET /carrier_lines/1
  # GET /carrier_lines/1.json
  def show
  end

  # GET /carrier_lines/new
  def new
    @carrier_line = CarrierLine.new
  end

  # GET /carrier_lines/1/edit
  def edit
  end

  # POST /carrier_lines
  # POST /carrier_lines.json
  def create
    @carrier_line = CarrierLine.new(carrier_line_params)

    respond_to do |format|
      if @carrier_line.save
        format.html { redirect_to @carrier_line, notice: 'Carrier line was successfully created.' }
        format.json { render :show, status: :created, location: @carrier_line }
      else
        format.html { render :new }
        format.json { render json: @carrier_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carrier_lines/1
  # PATCH/PUT /carrier_lines/1.json
  def update
    respond_to do |format|
      if @carrier_line.update(carrier_line_params)
        format.html { redirect_to @carrier_line, notice: 'Carrier line was successfully updated.' }
        format.json { render :show, status: :ok, location: @carrier_line }
      else
        format.html { render :edit }
        format.json { render json: @carrier_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carrier_lines/1
  # DELETE /carrier_lines/1.json
  def destroy
    @carrier_line.destroy
    respond_to do |format|
      format.html { redirect_to carrier_lines_url, notice: 'Carrier line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carrier_line
      @carrier_line = CarrierLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carrier_line_params
       params.require(:carrier_line).permit(:name, :legalName, :tel,:mail, :comercialBusiness, :active, :code)
    end
end
