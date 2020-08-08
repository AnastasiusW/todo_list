class ApplicationController < ActionController::API
  include Pundit
  include ExceptionsHandler

  def authorize_request!
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    @payload = JsonWebTokenService.decode(header)
  end

  private

  def current_user
    @current_user ||= User.find(@payload[:user_id])
  end

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
