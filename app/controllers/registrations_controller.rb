class RegistrationsController < ApplicationController
  SECRET = Rails.application.secrets.secret_key_base

  def create
    user = User.normal.new(user_params)
    if user.valid?
      user.save
      render json: {
        status: :created,
        user: user,
        token: JWT.encode({ user_id: user.id, exp: Time.now.to_i + 7 * 86_400 }, SECRET, 'HS256')
      }, status: :created
    else
      render json: {
        errors: user.errors.as_json
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
