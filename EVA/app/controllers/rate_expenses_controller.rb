class RateExpensesController < ApplicationController
  before_action :set_rate_expense, only: [:show, :edit, :update, :destroy]

  # GET /rate_expenses
  # GET /rate_expenses.json
  def index
    @rate_expenses = RateExpense.all
  end

  # GET /rate_expenses/1
  # GET /rate_expenses/1.json
  def show
  end

  # GET /rate_expenses/new
  def new
    @rate_expense = RateExpense.new
  end

  # GET /rate_expenses/1/edit
  def edit
  end

  # POST /rate_expenses
  # POST /rate_expenses.json
  def create
    @rate_expense = RateExpense.new(rate_expense_params)

    respond_to do |format|
      if @rate_expense.save
        format.html { redirect_to @rate_expense, notice: 'Rate expense was successfully created.' }
        format.json { render :show, status: :created, location: @rate_expense }
      else
        format.html { render :new }
        format.json { render json: @rate_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rate_expenses/1
  # PATCH/PUT /rate_expenses/1.json
  def update
    respond_to do |format|
      if @rate_expense.update(rate_expense_params)
        format.html { redirect_to @rate_expense, notice: 'Rate expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @rate_expense }
      else
        format.html { render :edit }
        format.json { render json: @rate_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rate_expenses/1
  # DELETE /rate_expenses/1.json
  def destroy
    @rate_expense.destroy
    respond_to do |format|
      format.html { redirect_to rate_expenses_url, notice: 'Rate expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rate_expense
      @rate_expense = RateExpense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rate_expense_params
      params.fetch(:rate_expense, {})
    end
end
