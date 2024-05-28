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
      @payment.payment_reference_number = generate_reference_no
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

      def generate_reference_no
        year = Time.now.year
        last_payment = Payment.where("payment_reference_number LIKE ?", "#{year}%").order(payment_reference_number: :desc).first
          if last_payment.present?
            string_year = year.to_s
            last_id_number = last_payment.payment_reference_number.split(string_year).last.to_i
            new_id_number = last_id_number + 1
            payment_reference_number = "#{year}#{'%03d' % new_id_number}"
          else
            payment_reference_number = "#{year}001"
          end
      end
end
  