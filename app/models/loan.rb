class Loan < ApplicationRecord
  belongs_to :member
  belongs_to :loan_type
  has_many :payments, dependent: :destroy

  validates :loan_amount, :loan_duration, :loan_status, presence: true
end
