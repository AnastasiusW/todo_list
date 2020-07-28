class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    return render json: UserSerializer.new(user).serialized_json, status: :created if user.save

    render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
  end

  private

  def user_params
    params.permit(:user_name, :password, :password_confirmation)
  end
end
