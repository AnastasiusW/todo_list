class TaskPolicy < ApplicationPolicy
  def update?
    belongs_to_user?
  end

  def show?
    belongs_to_user?
  end

  def destroy?
    belongs_to_user?
  end

  def complete?
    belongs_to_user?
  end

  def position?
    belongs_to_user?
  end

  def create?
    belongs_to_user?
  end

  def index?
    user.present? && user.persisted? && user == record.first.project.user
  end

  private

  def belongs_to_user?
    user.present? && user.persisted? && user == record.project.user
  end
end
