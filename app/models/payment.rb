class Payment < ApplicationRecord
  belongs_to :member
  belongs_to :loan

  after_create :update_loan_amount

  private

  def update_loan_amount
    loan = Loan.find_by(member_id: self.member_id)
    if loan
      new_amount = loan.loan_amount - self.payment_amount
      loan.update(loan_amount: new_amount)
    end
  end
end
