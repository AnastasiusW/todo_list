class Api::V1::CommentsController < ApplicationController
  before_action :authorize_request

  def index
    render json: CommentSerializer.new(find_task.comments).serialized_json, status: :ok if find_task
  end

  def create
    comment = Comment.new(comment_params)
    return render json: CommentSerializer.new(comment).serialized_json, status: :created if comment.save

    validation_error(comment.errors, :unprocessable_entity)
  end

  def destroy
    authorize(current_comment)

    render json: {}, status: :ok if current_comment.destroy
  end

  private

  def comment_params
    params.permit(:task_id, :body, :file, :id)
  end

  def find_task
    Task.find_by!(id: comment_params[:task_id])
  end
end
