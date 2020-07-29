class Api::V1::ProjectsController < ApplicationController
  before_action :authorize_request

  def index
    render json: ProjectSerializer.new(current_user.projects).serialized_json, status: :ok
  end

  def show
    authorize(current_project)

    render json: ProjectSerializer.new(current_project).serialized_json, status: :ok
  end

  def create
    project = current_user.projects.new(name: project_params[:name], user: current_user)
    return render json: ProjectSerializer.new(project).serialized_json, status: :created if project.save

    validation_error(project.errors, :unprocessable_entity)
  end

  def update
    authorize(current_project)
    if current_project.update(name: project_params[:name])
      return render json: ProjectSerializer.new(current_project).serialized_json, status: :ok
    end

    validation_error(current_project.errors, :unprocessable_entity)
  end

  def destroy
    authorize(current_project)

    render json: {}, status: :ok if current_project.destroy
  end

  private

  def project_params
    params.permit(:name, :id)
  end
end
