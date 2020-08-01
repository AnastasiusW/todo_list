class ApplicationController < ActionController::API
  include Pundit
  include ExceptionsHandler

  attr_reader :current_user

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    @decoded = JsonWebTokenService.decode(header)
    @current_user = User.find(@decoded[:user_id])
  end

  private

  def current_project
    @current_project ||= Project.find_by!(id: params[:id])
  end

  def current_task
    @current_task ||= Task.find_by!(id: params[:id])
  end

  def current_comment
    @current_comment ||= Comment.find_by!(id: params[:id])
  end
end
