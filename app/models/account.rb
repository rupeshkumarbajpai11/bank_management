class Account < ApplicationRecord

  #associations
  belongs_to :bank

  #validations
  validates :account_number, presence: true, uniqueness: true, length:{ in: 9..18 }
  validates :account_holder_name, :opening_amount, :opening_bonus, :closing_amount, presence: true
end