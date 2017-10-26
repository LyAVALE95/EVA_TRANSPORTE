class ClientcontactsController < ApplicationController
  before_action :set_clientcontact, only: [:show, :edit, :update, :destroy]

  # GET /clientcontacts
  # GET /clientcontacts.json
  def index
    @clientcontacts = Clientcontact.all
  end

  # GET /clientcontacts/1
  # GET /clientcontacts/1.json
  def show
  end

  # GET /clientcontacts/new
  def new
    @clientcontact = Clientcontact.new
  end

  # GET /clientcontacts/1/edit
  def edit
  end

  # POST /clientcontacts
  # POST /clientcontacts.json
  def create
    @clientcontact = Clientcontact.new(clientcontact_params)

    respond_to do |format|
      if @clientcontact.save
        format.html { redirect_to @clientcontact, notice: 'Clientcontact was successfully created.' }
        format.json { render :show, status: :created, location: @clientcontact }
      else
        format.html { render :new }
        format.json { render json: @clientcontact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientcontacts/1
  # PATCH/PUT /clientcontacts/1.json
  def update
    respond_to do |format|
      if @clientcontact.update(clientcontact_params)
        format.html { redirect_to @clientcontact, notice: 'Clientcontact was successfully updated.' }
        format.json { render :show, status: :ok, location: @clientcontact }
      else
        format.html { render :edit }
        format.json { render json: @clientcontact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientcontacts/1
  # DELETE /clientcontacts/1.json
  def destroy
    @clientcontact.destroy
    respond_to do |format|
      format.html { redirect_to clientcontacts_url, notice: 'Clientcontact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clientcontact
      @clientcontact = Clientcontact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clientcontact_params
   params.require(:clientcontact).permit(:name, :legalName, :tel, :mail,:comercialBusiness, :active, :code)
    end
end
