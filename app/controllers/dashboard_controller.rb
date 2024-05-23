class DashboardController < ApplicationController
  def index
    @member_count = Member.count
    @loan_count = Loan.count
  end
end
