# frozen_string_literal: true

module API
  module Defaults
    extend ActiveSupport::Concern

    included do
      helpers do
        def error_message(object)
          object.errors.full_messages.uniq.join(",")
        end

        def respond(code = nil, data = nil)
          status code if code
          body data if data
        end

        def respond_error(code = nil, message = '')
          error!(message, code)
        end
      end
    end
  end
end
