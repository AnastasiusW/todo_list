module Docs
  module V1
    module Complete
      extend Dox::DSL::Syntax

      document :api do
        resource 'Complete' do
          endpoint '/projects/:id/tasks/complete/:id'
          group 'Tasks/Complete'
        end
      end

      document :update do
        action 'Update complete'
      end
    end
  end
end
