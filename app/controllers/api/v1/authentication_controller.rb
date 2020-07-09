class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :create
  def create
    user= User.find_by(user_name: user_params[:user_name])
    if user&.authenticate(user_params[:password])
      render json: {token: JsonWebToken.encode(user_id: user.id)}, status: :ok
    else
      render json: { errors: I18n.t('errors.login') }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:user_name, :password)
  end
end
