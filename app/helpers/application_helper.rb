# frozen_string_literal: true

module ApplicationHelper
  def show_error(object, attribute_name)
    object.errors.full_messages_for(attribute_name).join(',') if object.errors.any?
  end

  def author_list
  	Author.all.map{|a| [a.first_name + ' ' + a.last_name, a.id]}
  end
end
