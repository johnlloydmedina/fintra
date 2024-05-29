class Loan < ApplicationRecord
  belongs_to :member
  belongs_to :loan_type
  belongs_to :user, foreign_key: 'processed_by', optional: true

  enum mode_of_payment: { over_the_counter: 0, bank_transfer: 1, salary_deduction: 2 }

  validates :control_number, :member_id, :loan_type_id, :loan_amount, :loan_duration, :loan_status, presence: true
  validates :purpose, :remarks, length: { maximum: 500 }
  
  before_validation :set_loan_duration_based_on_type

  private

  def set_loan_duration_based_on_type
    self.loan_duration = loan_type.duration if loan_type.present?
  end
end
