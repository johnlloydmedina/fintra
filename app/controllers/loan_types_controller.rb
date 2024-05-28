class LoanTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_loan_type, only: %i[show edit update destroy]

  def index
    @loan_types = LoanType.all
  end

  def show
  end

  def new
    @loan_type = LoanType.new
  end

  def edit
  end

  def create
    @loan_type = LoanType.new(loan_type_params)
    if @loan_type.save
      redirect_to loan_types_url, notice: 'Loan type was successfully created.'
    else
      render :new
    end
  end

  def update
    if @loan_type.update(loan_type_params)
      redirect_to @loan_type, notice: 'Loan type was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @loan_type.destroy
    redirect_to loan_types_url, notice: 'Loan type was successfully destroyed.'
  end

  private

    def set_loan_type
      @loan_type = LoanType.find(params[:id])
    end

    def loan_type_params
      params.require(:loan_type).permit(:loan_type_name, :description, :interest, :duration, :penalty)
    end
end
