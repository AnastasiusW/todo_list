class CommentPolicy < ApplicationPolicy
  def destroy?
    check_policy
  end

  private

  def check_policy
    user.present? && user == record.task.project.user
  end
end
