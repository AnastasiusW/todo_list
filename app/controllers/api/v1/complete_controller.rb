module Api
  module V1
    class CompleteController < ApplicationController
      before_action :authorize_request!

      def update
        authorize(current_task)
        if current_task.update(done: complete_params[:done])
          return render json: TaskSerializer.new(current_task).serialized_json, status: :ok
        end

        validation_error(current_task.errors, :unprocessable_entity)
      end

      private

      def complete_params
        params.permit(:done)
      end
    end
  end
end
