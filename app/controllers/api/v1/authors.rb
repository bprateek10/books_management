# frozen_string_literal: true

module API
  module V1
    class Authors < API::V1::Base
      include API::Defaults

      resource :authors do
        desc 'Get an Author details', {
        }
        get ":id" do
          respond(200, {})
        end
      end
      
    end
  end
end
