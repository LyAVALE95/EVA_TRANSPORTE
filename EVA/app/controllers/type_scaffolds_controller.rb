class TypeScaffoldsController < ApplicationController
  before_action :set_type_scaffold, only: [:show, :edit, :update, :destroy]

  # GET /type_scaffolds
  # GET /type_scaffolds.json
  def index
    @type_scaffolds = TypeScaffold.all
  end

  # GET /type_scaffolds/1
  # GET /type_scaffolds/1.json
  def show
  end

  # GET /type_scaffolds/new
  def new
    @type_scaffold = TypeScaffold.new
  end

  # GET /type_scaffolds/1/edit
  def edit
  end

  # POST /type_scaffolds
  # POST /type_scaffolds.json
  def create
    @type_scaffold = TypeScaffold.new(type_scaffold_params)

    respond_to do |format|
      if @type_scaffold.save
        format.html { redirect_to @type_scaffold, notice: 'Type scaffold was successfully created.' }
        format.json { render :show, status: :created, location: @type_scaffold }
      else
        format.html { render :new }
        format.json { render json: @type_scaffold.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_scaffolds/1
  # PATCH/PUT /type_scaffolds/1.json
  def update
    respond_to do |format|
      if @type_scaffold.update(type_scaffold_params)
        format.html { redirect_to @type_scaffold, notice: 'Type scaffold was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_scaffold }
      else
        format.html { render :edit }
        format.json { render json: @type_scaffold.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_scaffolds/1
  # DELETE /type_scaffolds/1.json
  def destroy
    @type_scaffold.destroy
    respond_to do |format|
      format.html { redirect_to type_scaffolds_url, notice: 'Type scaffold was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_scaffold
      @type_scaffold = TypeScaffold.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_scaffold_params
      params.fetch(:type_scaffold, {})
    end
end
