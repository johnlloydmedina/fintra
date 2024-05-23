class LoansController < ApplicationController
    before_action :set_loan, only: [:show, :edit, :update, :destroy]
  
    def index
      @loans = Loan.all
    end
  
    def show
    end
  
    def new
      @loan = Loan.new
      @members = Member.all
      @loan_types = LoanType.all
    end
  
    def edit
      @members = Member.all
      @loan_types = LoanType.all
    end
  
    def create
      @loan = Loan.new(loan_params)
      if @loan.save
        redirect_to @loan, notice: 'Loan was successfully created.'
      else
        @members = Member.all
        @loan_types = LoanType.all
        render :new
      end
    end
  
    def update
      if @loan.update(loan_params)
        redirect_to @loan, notice: 'Loan was successfully updated.'
      else
        @members = Member.all
        @loan_types = LoanType.all
        render :edit
      end
    end
  
    def destroy
      @loan.destroy
      redirect_to loans_url, notice: 'Loan was successfully destroyed.'
    end
  
    private
      def set_loan
        @loan = Loan.find(params[:id])
      end
  
      def loan_params
        params.require(:loan).permit(:control_number, :member_id, :loan_type_id, :loan_amount, :loan_duration, :loan_status, :processed_by)
      end
end
