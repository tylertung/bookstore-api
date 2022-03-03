class AuthController < ApplicationController
  def login
    user = User.find_by(email: login_params[:email])
    if user && user.authenticate(login_params[:password])
      token = JWT.encode({ user_id: user.id, exp: Time.now.to_i + 7 * 86_400 }, RegistrationsController::SECRET,
                         'HS256')
      render json: { status: :accepted, token: token }
    else
      render json: { message: fail_authenticate, status: :unprocessable_entity }
    end
  end

  def persist
    if request.headers['Authorization']
      encoded_token = request.headers['Authorization'].split(' ')[1]
      token = JWT.decode(encoded_token, RegistrationsController::SECRET, true, { algorithm: 'HS256' })
      user_id = token[0]['user_id']
      user = User.find(user_id)
      render json: { status: :accepted, user: UserSerializer.new(user) }
    end
  end

  private

  def login_params
    params.required(:user).permit(:email, :password)
  end

  def fail_authenticate
    'Wrong email or password ! Please try again!'
  end
end
