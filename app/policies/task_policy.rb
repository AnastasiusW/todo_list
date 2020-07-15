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

  private

  def check_policy
    binding.pry
    user.present? && user == record.project.user
  end
end
