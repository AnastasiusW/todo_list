class Api::V1::AuthenticationController < ApplicationController
  def create
    user = User.find_by(user_name: user_params[:user_name])
    if user&.authenticate(user_params[:password])
      render json: { token: JsonWebToken.encode(user_id: user.id) }, status: :ok
    else
      render json: { errors: I18n.t('.login') }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:user_name, :password)
  end
end
