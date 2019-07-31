class RegistrationsController < Devise::RegistrationsController

  private
  def sign_up_params
    params.permit(:firstname, :lastname, :email, :password, :username, :idcard, :address)
  end

  
end