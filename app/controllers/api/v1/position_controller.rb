class Api::V1::PositionController < ApplicationController
  before_action :authorize_request

  def update
    authorize(current_task)

    if Task::Position.call(current_task, position_params[:position])
      return render json: TaskSerializer.new(current_task).serialized_json, status: :ok
    end

    standard_error(I18n.t('errors.tasks.position'), :unprocessable_entity)
  end

  private

  def position_params
    params.permit(:id, :position)
  end
end
