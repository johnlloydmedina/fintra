class LoanType < ApplicationRecord
    validates :loan_type_name, :description, :interest, :duration, :penalty, presence: true
    validates :interest, inclusion: { in: [5, 10, 15, 20] }
    validates :duration, inclusion: { in: ["1 week", "1 month", "3 months", "6 months", "1 year"] }
    validates :penalty, inclusion: { in: [0, 5] }
end
  