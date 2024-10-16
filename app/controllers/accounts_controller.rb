class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bank
  before_action :set_account, only: [:edit, :update, :destroy]

  def index
    @accounts = @bank.accounts
  end

  def new
    @account = @bank.accounts.build
  end

  def create
    @account = @bank.accounts.build(account_params)
    if @account.save
      redirect_to root_path, notice: 'Account created successfully.'
    else
      flash[:alert] = @account.errors.full_messages.join(", ") 
      redirect_to new_bank_account_path(@bank)
    end
  end

  def edit
    # @account is set via before_action
  end

  def update
    if @account.update(account_params)
      redirect_to root_path, notice: 'Account updated successfully.'
    else
      flash[:alert] = @account.errors.full_messages.join(", ")
      redirect_to edit_bank_account_path(@bank, @account)
    end
  end

  def destroy
    @account.destroy
    redirect_to root_path, notice: 'Account deleted successfully.'
  end

  private

  def set_bank
    @bank = current_user.bank
  end

  def set_account
    @account = @bank.accounts.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Account not found.'
  end

  def account_params
    params.require(:account).permit(:account_number, :account_holder_name, :opening_amount, :opening_bonus, :closing_amount)
  end
end
