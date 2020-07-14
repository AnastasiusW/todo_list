class Api::V1::TasksController < ApplicationController

  def create
    task = Task.new(name:task_params[:name],project_id: task_params[:project_id])
    return render json: TaskSerializer.new(task).serialized_json, status: :created  if task.save
    render json: {errors: task.errors.full_messages}, status: :unprocessable_entity

  end

  private

  def task_params
    params.permit(:name, :project_id, :postion)
  end
end
