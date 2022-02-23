class RegistrationsController < ApplicationController
  SECRET = Rails.application.secrets.secret_key_base

  def create
    user = User.create(
      user_params
    )
    if user.valid?
      user.update(role: :normal)
      render json: {
        status: :created,
        user: user,
        token: JWT.encode({ user_id: user.id }, SECRET, 'HS256')
      }
    else
      render json: {
        errors: to_errors_object(user),
        status: :unprocessable_entity
      }
    end
  end

  private

  def to_errors_object(full_errors)
    obj = {}
    obj[:first_name] = full_errors.errors[:first_name]
    obj[:last_nạme] = full_errors.errors[:last_name]
    obj[:dob] = full_errors.errors[:dob]
    obj[:gender] = full_errors.errors[:gender]
    obj[:email] = full_errors.errors[:email]
    obj[:password] = full_errors.errors[:password]
    obj
  end

  def user_params
    params.required(:user).permit(:first_name, :last_name, :username, :dob, :gender, :email, :password,
                                  :password_confirmation)
  end
end
