class TaskPolicy < ApplicationPolicy
  def update?
    check_policy
  end

  def show?
    check_policy
  end

  def destroy?
    check_policy
  end

  def complete?
    check_policy
  end

  def position?
    check_policy
  end

  private

  def check_policy
    user.present? && user.persisted? && user == record.project.user
  end
end
