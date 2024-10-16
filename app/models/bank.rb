class Bank < ApplicationRecord

  #associations
  belongs_to :user
  has_many :accounts, dependent: :destroy

  #validations
  validates :name, presence: true
end