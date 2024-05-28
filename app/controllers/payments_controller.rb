class PaymentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_payment, only: [:show, :edit, :update, :destroy]
    before_action :set_members_and_loans, only: [:new, :edit]
  
    def index
      @payments = Payment.paginate(page: params[:page], per_page: 10)
    end
  
    def show
    end
  
    def new
      @payment = Payment.new
    end
  
    def edit
    end
  
    def create
      @payment = Payment.new(payment_params)
      if @payment.save
        redirect_to payments_url, notice: 'Payment was successfully created.'
      else
        set_members_and_loans
        render :new
      end
    end
  
    def update
      if @payment.update(payment_params)
        redirect_to @payment, notice: 'Payment was successfully updated.'
      else
        set_members_and_loans
        render :edit
      end
    end
  
    def destroy
      @payment.destroy
      redirect_to payments_url, notice: 'Payment was successfully destroyed.'
    end
  
    private
  
      def set_payment
        @payment = Payment.find(params[:id])
      end
  
      def set_members_and_loans
        @members = Member.all
        @loans = Loan.all
      end
  
      def payment_params
        params.require(:payment).permit(:payment_reference_number, :member_id, :loan_id, :date, :payment_amount, :payment_status, :review_by)
      end
end
  