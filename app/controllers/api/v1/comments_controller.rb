module Api
  module V1
    class CommentsController < ApplicationController
      before_action :authorize_request

      def index
        task = Task.find_by!(id: comment_params[:task_id])
        comments = task.comments
        authorize(comments)
        render json: CommentSerializer.new(comments).serialized_json, status: :ok
      end

      def create
        comment = Comment.new(comment_params)
        authorize(comment)
        return render json: CommentSerializer.new(comment).serialized_json, status: :created if comment.save

        validation_error(comment.errors, :unprocessable_entity)
      end

      def destroy
        authorize(current_comment)

        current_comment.destroy ? head(:ok) : head(:no_content)
      end

      private

      def comment_params
        params.permit(:task_id, :body, :file, :id)
      end
    end
  end
end
