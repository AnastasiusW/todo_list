class CommentPolicy < ApplicationPolicy
  def destroy?
    belongs_to_user?
  end

  def create?
    belongs_to_user?
  end

  class Scope < Scope
    def resolve
      scope.joins(task: :project).where(tasks: { projects: { user: user } })
    end
  end

  private

  def belongs_to_user?
    user.present? && user.persisted? && user == record.task.project.user
  end
end
