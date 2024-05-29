class Payment < ApplicationRecord
  belongs_to :member
  belongs_to :loan

  after_create :update_loan_balance

  private

  def update_loan_balance
    loan = Loan.find_by(id: self.loan_id)
    if loan
      new_balance = loan.loan_balance - self.payment_amount
      loan.update(loan_balance: new_balance)
    end
  end
end
