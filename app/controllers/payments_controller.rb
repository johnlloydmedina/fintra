class PaymentsController < ApplicationController
    before_action :set_payment, only: [:show, :edit, :update, :destroy]
  
    def index
      @payments = Payment.all
    end
  
    def show
    end
  
    def new
      @payment = Payment.new
      @members = Member.all
    end
  
    def edit
      @members = Member.all
    end
  
    def create
      @payment = Payment.new(payment_params)
      if @payment.save
        redirect_to @payment, notice: 'Payment was successfully created.'
      else
        @members = Member.all
        render :new
      end
    end
  
    def update
      if @payment.update(payment_params)
        redirect_to @payment, notice: 'Payment was successfully updated.'
      else
        @members = Member.all
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
  
      def payment_params
        params.require(:payment).permit(:payment_reference_number, :member_id, :date, :payment_amount, :payment_status, :review_by)
      end
end
  