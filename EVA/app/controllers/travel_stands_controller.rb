class TravelStandsController < ApplicationController
  before_action :set_travel_stand, only: [:show, :edit, :update, :destroy]

  # GET /travel_stands
  # GET /travel_stands.json
  def index
    @travel_stands = TravelStand.all
  end

  # GET /travel_stands/1
  # GET /travel_stands/1.json
  def show
  end

  # GET /travel_stands/new
  def new
    @travel_stand = TravelStand.new
  end

  # GET /travel_stands/1/edit
  def edit
  end

  # POST /travel_stands
  # POST /travel_stands.json
  def create
    @travel_stand = TravelStand.new(travel_stand_params)

    respond_to do |format|
      if @travel_stand.save
        format.html { redirect_to @travel_stand, notice: 'Travel stand was successfully created.' }
        format.json { render :show, status: :created, location: @travel_stand }
      else
        format.html { render :new }
        format.json { render json: @travel_stand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travel_stands/1
  # PATCH/PUT /travel_stands/1.json
  def update
    respond_to do |format|
      if @travel_stand.update(travel_stand_params)
        format.html { redirect_to @travel_stand, notice: 'Travel stand was successfully updated.' }
        format.json { render :show, status: :ok, location: @travel_stand }
      else
        format.html { render :edit }
        format.json { render json: @travel_stand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travel_stands/1
  # DELETE /travel_stands/1.json
  def destroy
    @travel_stand.destroy
    respond_to do |format|
      format.html { redirect_to travel_stands_url, notice: 'Travel stand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_stand
      @travel_stand = TravelStand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_stand_params
      params.fetch(:travel_stand, {})
    end
end
