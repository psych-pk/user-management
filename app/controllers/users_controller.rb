class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :restrict_unauthorized_access
  before_action :set_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_address_params)
        format.html { redirect_to users_path, notice: 'User details successfully updated' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_address_params
    params.require(:user).permit(
      :address_line_1,
      :address_line_2,
      :city,
      :mobile_number 
    )
  end

  def restrict_unauthorized_access
    unless current_user.is_admin?
      redirect_to root_path, notice: 'Access denied'
    end
  end

end