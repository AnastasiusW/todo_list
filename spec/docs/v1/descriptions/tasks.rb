module Docs
  module V1
    module Tasks
      extend Dox::DSL::Syntax

      document :api do
        resource 'Tasks' do
          endpoint '/projects/:id/tasks'
          group 'Tasks'
        end
      end

      document :index do
        action 'Get tasks'
      end

      document :show do
        action 'Show task'
      end

      document :create do
        action 'Create tasks'
      end

      document :update do
        action 'Update task'
      end

      document :position do
        action 'Update position'
      end

      document :complete do
        action 'Update complete'
      end

      document :destroy do
        action 'Delete task'
      end
    end
  end
end
