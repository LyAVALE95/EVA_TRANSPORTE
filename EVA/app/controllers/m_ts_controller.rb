class MTsController < ApplicationController
  before_action :set_mt, only: [:show, :edit, :update, :destroy]

  # GET /mts
  # GET /mts.json
  def index
    @mts = Mt.all
  end

  # GET /mts/1
  # GET /mts/1.json
  def show
  end

  # GET /mts/new
  def new
    @mt = Mt.new
  end

  # GET /mts/1/edit
  def edit
  end

  # POST /mts
  # POST /mts.json
  def create
    @mt = Mt.new(mt_params)

    respond_to do |format|
      if @mt.save
        format.html { redirect_to @mt, notice: 'Mt was successfully created.' }
        format.json { render :show, status: :created, location: @mt }
      else
        format.html { render :new }
        format.json { render json: @mt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mts/1
  # PATCH/PUT /mts/1.json
  def update
    respond_to do |format|
      if @mt.update(mt_params)
        format.html { redirect_to @mt, notice: 'Mt was successfully updated.' }
        format.json { render :show, status: :ok, location: @mt }
      else
        format.html { render :edit }
        format.json { render json: @mt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mts/1
  # DELETE /mts/1.json
  def destroy
    @mt.destroy
    respond_to do |format|
      format.html { redirect_to mts_url, notice: 'Mt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mt
      @mt = Mt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mt_params
      params.fetch(:mt, {})
    end
end
