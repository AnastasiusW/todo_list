class Api::V1::CommentsController < ApplicationController
  before_action :authorize_request

  def index
    return not_authorize unless current_task

    render json: CommentSerializer.new(current_task.comments).serialized_json, status: :ok
  end

  def create
    comment = Comment.new(comment_params)
    return render json: CommentSerializer.new(comment).serialized_json, status: :created if comment.save

    render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
  end

  def destroy
    return not_authorize unless set_comment

    @comment.destroy
    render json: {}, status: :ok
  end

  private

  def comment_params
    params.permit(:task_id, :body, :file, :id)
  end

  def set_comment
    @comment = Comment.find_by(id: comment_params[:id])
    authorize @comment if @comment
  end

  def current_task
    Task.find_by(id: params[:task_id])
  end
end
