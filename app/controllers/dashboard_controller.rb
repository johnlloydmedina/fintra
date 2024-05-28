class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @member_count = Member.count
    @active_members = Member.where(account_status: 1).count
    @loan_count = Loan.count
    @total_loan_amount = Loan.sum(:loan_amount)
    @total_payment_amount = Payment.sum(:payment_amount)
    @total_payments_today = Payment.where(date: Date.today).sum(:payment_amount)
  end
end
