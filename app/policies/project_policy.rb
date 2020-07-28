class ProjectPolicy < ApplicationPolicy
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
    user.present? && user.persisted? && user == record.user
  end
end
