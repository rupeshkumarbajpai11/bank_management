class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #associations
  has_one :bank, dependent: :destroy

  attr_accessor :bank_name
  
  #validations
  validates :email, uniqueness: true
end
