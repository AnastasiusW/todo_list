class Api::V1::TasksController < ApplicationController
  before_action :authorize_request

  def index
    render json: TaskSerializer.new(find_project_for_tasks.tasks).serialized_json, status: :ok if find_project_for_tasks
  end

  def show
    authorize(current_task)
    render json: TaskSerializer.new(current_task).serialized_json, status: :ok
  end

  def create
    task = Task.new(task_params)
    return render json: TaskSerializer.new(task).serialized_json, status: :created if task.save

    render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
  end

  def update
    authorize(current_task)

    if current_task.update(task_params)
      render json: TaskSerializer.new(current_task).serialized_json, status: :ok
    else
      render json: { errors: current_task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def position
    authorize(current_task)

    if Task::Position.call(current_task, task_params[:position])
      return render  json: TaskSerializer.new(current_task).serialized_json, status: :ok
    end

    render json: { errors: current_task.errors.full_messages }, status: :unprocessable_entity
  end

  def complete
    authorize(current_task)

    if current_task.update(done: task_params[:done])
      return render json: TaskSerializer.new(current_task).serialized_json, status: :ok
    end

    render json: { errors: current_task.errors.full_messages }, status: :unprocessable_entity
  end

  def destroy
    authorize(current_task)

    render json: {}, status: :ok if current_task.destroy
  end

  private

  def task_params
    params.permit(:name, :project_id, :position, :id, :done, :deadline)
  end

  def find_project_for_tasks
    current_user.projects.find_by!(id: task_params[:project_id])
  end
end
