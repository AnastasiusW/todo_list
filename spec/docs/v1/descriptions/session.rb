module Docs
  module V1
    module Session
      extend Dox::DSL::Syntax

      document :api do
        resource 'Session' do
          endpoint '/sign_in'
          group 'Session'
        end
      end

      document :create do
        action 'Sign in user'
      end
    end
  end
end
