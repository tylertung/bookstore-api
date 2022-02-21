class RegistrationsController < ApplicationController
  def create
    params[:user][:role] = 'normal'
    user = User.create!(
      user_params
    )
    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        user: user
      }
    else
      render json: {
        status: 500
      }
    end
  end

  private

  def user_params
    params.required(:user).permit(:first_name, :last_name, :username, :dob, :gender, :email, :password,
                                  :password_confirmation, :role)
  end
end
