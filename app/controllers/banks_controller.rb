class BanksController < ApplicationController
  before_action :authenticate_user!

  def create
    @bank = current_user.build_bank(bank_params)
    if @bank.save
      redirect_to accounts_path, notice: 'Bank created successfully.'
    else
      render :new
    end
  end

  def show
    @bank = current_user.bank
    @accounts = @bank&.accounts
  end

  private

  def bank_params
    params.require(:bank).permit(:name)
  end
end
