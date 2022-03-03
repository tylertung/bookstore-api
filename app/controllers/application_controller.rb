class ApplicationController < ActionController::API
  include Pundit::Authorization

  def current_user
    if request.headers['Authorization']
      encoded_token = request.headers['Authorization'].split(' ')[1]
      token = JWT.decode(encoded_token, RegistrationsController::SECRET)
      user_id = token[0]['user_id']
      User.find(user_id)
    end
  end
end
