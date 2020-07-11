class Project < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user, message: I18n.t('errors.projects.project_exist') }
end
