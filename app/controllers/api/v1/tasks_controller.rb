class Api::V1::TasksController < ApplicationController
  before_action :authorize_request

  def index
    return not_authorize unless current_project

    render json: TaskSerializer.new(current_project.tasks).serialized_json, status: :ok
  end

  def show
    return not_authorize unless set_task
    return render json: TaskSerializer.new(@task).serialized_json, status: :ok if @task

    render json: { errors: I18n.t('errors.tasks.task_not_found') }, status: :unprocessable_entity
  end

  def create
    task = Task.new(task_params)
    return render json: TaskSerializer.new(task).serialized_json, status: :created if task.save

    render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
  end

  def update
    return not_authorize unless set_task

    if @task.update(task_params)
      render json: TaskSerializer.new(@task).serialized_json, status: :ok
    else
      render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def position
    return not_authorize unless set_task
    if Task::Position.call(@task, task_params[:position])
      return render  json: TaskSerializer.new(@task).serialized_json, status: :ok
    end

    render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
  end

  def complete
    return not_authorize unless set_task
    return render json: TaskSerializer.new(@task).serialized_json, status: :ok if @task.update(done: task_params[:done])

    render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
  end

  def destroy
    return not_authorize unless set_task

    @task.destroy
    render json: {}, status: :ok
  end

  private

  def task_params
    params.permit(:name, :project_id, :position, :id, :done, :deadline)
  end

  def set_task
    @task = Task.find_by(id: task_params[:id])
    authorize @task if @task
  end

  def not_authorize
    render json: { errors: [I18n.t('errors.authorize_fail')] }, status: :not_found
  end

  def current_project
    current_user.projects.find_by(id: params[:project_id])
  end
end
