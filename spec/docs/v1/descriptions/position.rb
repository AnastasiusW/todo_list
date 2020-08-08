module Docs
  module V1
    module Position
      extend Dox::DSL::Syntax

      document :api do
        resource 'Position' do
          endpoint '/projects/:id/tasks/position/:id'
          group 'Tasks/Position'
        end
      end

      document :update do
        action 'Update position'
      end
    end
  end
end
