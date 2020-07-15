class Api::V1::TasksController < ApplicationController
  def create
    task = Task.new(name: task_params[:name], project_id: task_params[:project_id])
    return render json: TaskSerializer.new(task).serialized_json, status: :created if task.save

    render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
  end

  def update
    return not_authorize unless set_project

  end

  private

  def task_params
    params.permit(:name, :project_id, :postion,:id)
  end

  def set_project
    @task = Task.find_by(id: task_params[:id])
    authorize @task if @task
  end

  def not_authorize
    render json: { errors: [I18n.t('errors.authorize_fail')] }, status: :not_found
  end
end
