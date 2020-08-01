module Api
  module V1
    class SessionController < ApplicationController
      def create
        user = User.find_by(user_name: user_params[:user_name])
        if user&.authenticate(user_params[:password])
          render json: { token: JsonWebTokenService.encode(user_id: user.id) }, status: :ok
        else
          standard_error(I18n.t('.login'), :unauthorized)
        end
      end

      private

      def user_params
        params.permit(:user_name, :password)
      end
    end
  end
end
