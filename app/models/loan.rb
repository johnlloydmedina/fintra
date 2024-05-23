class Loan < ApplicationRecord
  belongs_to :member
  belongs_to :loan_type
end
