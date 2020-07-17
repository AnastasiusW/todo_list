module Docs
  module V1
    module Authentication
      extend Dox::DSL::Syntax

      document :api do
        resource 'Authentication' do
          endpoint '/sign_in'
          group 'Authentication'
        end
      end

      document :create do
        action 'Sign in user'
      end
    end
  end
end
