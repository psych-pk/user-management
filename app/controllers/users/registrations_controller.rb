class Users::RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :image,
      :address_line_1,
      :address_line_2,
      :city,
      :mobile_number 
    )
  end

  def account_update_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :current_password,
      :image,
      :address_line_1,
      :address_line_2,
      :city,
      :mobile_number
    )
  end

end