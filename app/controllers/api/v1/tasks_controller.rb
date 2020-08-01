class Api::V1::TasksController < ApplicationController
  before_action :authorize_request

  def index
    project = current_user.projects.find_by!(id: task_params[:project_id])
    tasks = project.tasks
    authorize(tasks)
    render json: TaskSerializer.new(tasks).serialized_json, status: :ok
  end

  def show
    authorize(current_task)
    render json: TaskSerializer.new(current_task).serialized_json, status: :ok
  end

  def create
    task = Task.new(task_params)
    authorize(task)
    return render json: TaskSerializer.new(task).serialized_json, status: :created if task.save

    validation_error(task.errors, :unprocessable_entity)
  end

  def update
    authorize(current_task)

    if current_task.update(task_params)
      render json: TaskSerializer.new(current_task).serialized_json, status: :ok
    else
      validation_error(current_task.errors, :unprocessable_entity)
    end
  end

  def position
    authorize(current_task)

    if Task::Position.call(current_task, task_params[:position])
      return render json: TaskSerializer.new(current_task).serialized_json, status: :ok
    end

    standard_error(I18n.t('errors.tasks.position'), :unprocessable_entity)
  end

  def complete
    authorize(current_task)
    if current_task.update(done: task_params[:done])
      return render json: TaskSerializer.new(current_task).serialized_json, status: :ok
    end

    validation_error(current_task.errors, :unprocessable_entity)
  end

  def destroy
    authorize(current_task)

    current_task.destroy ? head(:ok) : head(:no_content)
  end

  private

  def task_params
    params.permit(:name, :project_id, :position, :id, :done, :deadline)
  end
end
