class AuthController < ApplicationController
  def login
    user = User.find_by(email: login_params[:email])
    if user && user.authenticate(login_params[:password])
      token = encode(user.id)
      render json: { status: :accepted, token: token }
    else
      render json: { message: (I18n.t 'user.login_failure') }, status: :unprocessable_entity
    end
  end

  def persist
    if request.headers['Authorization']
      encoded_token = request.headers['Authorization'].split[1]
      token = decode(encoded_token)
      user_id = token[0]['user_id']
      user = User.find(user_id)
      render json: { status: :accepted, user: UserSerializer.new(user) }
    end
  end

  private

  def login_params
    params.required(:user).permit(:email, :password)
  end
end
