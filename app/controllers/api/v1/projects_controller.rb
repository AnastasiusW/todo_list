class Api::V1::ProjectsController < ApplicationController
  before_action :authorize_request
  def create
    project = current_user.projects.new(name: project_params[:name],user: current_user)
    return render json: ProjectSerializer.new(project).serialized_json, status: :created  if project.save
    render json: {errors: [project .errors.full_messages]}, status: :unprocessable_entity
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
