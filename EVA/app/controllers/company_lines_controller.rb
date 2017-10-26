class CompanyLinesController < ApplicationController
  before_action :set_company_line, only: [:show, :edit, :update, :destroy]

  # GET /company_lines
  # GET /company_lines.json
  def index
    @company_lines = CompanyLine.all
  end

  # GET /company_lines/1
  # GET /company_lines/1.json
  def show
  end

  # GET /company_lines/new
  def new
    @company_line = CompanyLine.new
  end

  # GET /company_lines/1/edit
  def edit
  end

  # POST /company_lines
  # POST /company_lines.json
  def create
    @company_line = CompanyLine.new(company_line_params)

    respond_to do |format|
      if @company_line.save
        format.html { redirect_to @company_line, notice: 'Company line was successfully created.' }
        format.json { render :show, status: :created, location: @company_line }
      else
        format.html { render :new }
        format.json { render json: @company_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_lines/1
  # PATCH/PUT /company_lines/1.json
  def update
    respond_to do |format|
      if @company_line.update(company_line_params)
        format.html { redirect_to @company_line, notice: 'Company line was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_line }
      else
        format.html { render :edit }
        format.json { render json: @company_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_lines/1
  # DELETE /company_lines/1.json
  def destroy
    @company_line.destroy
    respond_to do |format|
      format.html { redirect_to company_lines_url, notice: 'Company line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_line
      @company_line = CompanyLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_line_params
     params.require(:company_line).permit(:carrier_line_d, :company_id)
    end
end
