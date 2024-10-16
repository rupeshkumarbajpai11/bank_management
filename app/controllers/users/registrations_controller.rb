class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
    end
  end

  protected

  def after_sign_up_path_for(resource)
    bank_name = resource.bank_name
    if bank_name.present?
      bank = resource.create_bank(name: bank_name)

      if bank.persisted?
        return bank_path(bank)
      else
        flash[:alert] = "Bank creation failed. Please try again."
      end
    end
    root_path
  end
end