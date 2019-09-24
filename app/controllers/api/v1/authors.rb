# frozen_string_literal: true

module API
  module V1
    class Authors < API::V1::Base
      include API::Defaults

      resource :authors do
        desc 'Get an Author details', {}
        get ":id", jbuilder: 'authors/index.json.jbuilder' do
          @author = Author.find_by_id(params[:id])
          respond_error("Author not found", 404) if @author.nil?
        end
      end
    end
  end
end
