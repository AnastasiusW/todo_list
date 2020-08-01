class CommentPolicy < ApplicationPolicy
  def destroy?
    belongs_to_user?
  end

  def create?
    belongs_to_user?
  end

  def index?
    user.present? && user.persisted? && user == record.first.task.project.user
  end

  private

  def belongs_to_user?
    user.present? && user.persisted? && user == record.task.project.user
  end
end
