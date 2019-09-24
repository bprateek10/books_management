# frozen_string_literal: true

module API
  module V1
    class Base < API::Base
      formatter :json, Grape::Formatter::Jbuilder

      rescue_from ActiveRecord::RecordNotFound do |e|
        error!('Record not found.', 404)
      end

      rescue_from ActiveRecord::InvalidForeignKey do |e|
        error!('Unprocessable entity.', 422)
      end

      rescue_from ArgumentError do |e|
        error!(e.message.remove("'"), 422)
      end

      version 'v1'

      mount API::V1::Authors
    end
  end
end
