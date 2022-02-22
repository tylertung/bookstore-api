class RegistrationsController < ApplicationController
  SECRET = Rails.application.secrets.secret_key_base

  def create
    user = User.create(
      user_params
    )
    if user
      user.update(role: :normal)
      render json: {
        status: :created,
        user: user,
        token: JWT.encode({ user_id: user.id }, SECRET, 'HS256')
      }
    else
      render json: {
        errors: user.errors.full_messages,
        status: :unprocessable_entity
      }
    end
  end

  private

  def user_params
    params.required(:user).permit(:first_name, :last_name, :username, :dob, :gender, :email, :password,
                                  :password_confirmation)
  end
end
