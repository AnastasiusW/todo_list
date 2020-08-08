class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :user_id, message: I18n.t('.project_exist') }
end
