class Api::V1::ProjectsController < ApplicationController
  before_action :authorize_request

  def index
    render json: ProjectSerializer.new(current_user.projects).serialized_json, status: :ok
  end

  def show
    return not_authorize unless set_project
    return render json: ProjectSerializer.new(@project).serialized_json, status: :ok
  end

  def create
    project = current_user.projects.new(name: project_params[:name],user: current_user)
    return render json: ProjectSerializer.new(project).serialized_json, status: :created  if project.save
    render json: {errors: project.errors.full_messages}, status: :unprocessable_entity
  end

  def update
    return not_authorize unless set_project
    return  render json: ProjectSerializer.new(@project).serialized_json, status: :ok if @project.update(name: project_params[:name])
    return render json: {errors: @project.errors.full_messages}, status: :unprocessable_entity
     # set_project ? ProjectService::Update.new(current_project: @project,name: project_params[:name]).call : not_authorize
  end

  def destroy
    return not_authorize unless set_project
    @project.destroy
    render json: {}, status: :ok

  end

  private

  def project_params
    params.require(:project).permit(:name, :id)
  end

  def set_project
    @project = Project.find_by(id: project_params[:id])
    if @project
      authorize @project
    end
  end

  def not_authorize
   render json: {errors: [I18n.t('errors.authorize_fail')]}, status: :not_found
  end
end
