class ApplicationController < ActionController::API
  include Pundit::Authorization
  SECRET = Rails.application.secrets.secret_key_base

  def current_user
    if request.headers['Authorization']
      encoded_token = request.headers['Authorization'].split(' ')[1]
      token = decode(encoded_token)
      user_id = token[0]['user_id']
      User.find(user_id)
    end
  end

  def encode(data)
    JWT.encode({ user_id: data, exp: Time.now.to_i + 7 * 86_400 }, SECRET, 'HS256')
  end

  def decode(encoded_token)
    JWT.decode(encoded_token, SECRET, true, { algorithm: 'HS256' })
  end
end
