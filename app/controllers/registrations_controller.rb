class RegistrationsController < ApplicationController
  SECRET = Rails.application.secrets.secret_key_base

  def create
    user = User.normal.new(user_params)
    if user.valid?
      user.save
      render json: {
        status: :created,
        user:   user,
        token:  encode(user.id)
      }, status: :created
    else
      render json:   {
        message: user.errors
      },
             status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.required(:user).permit(:first_name, :last_name, :username, :dob, :gender, :email, :password,
                                  :password_confirmation)
  end
end
