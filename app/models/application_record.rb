# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def present
    return self unless presenter_class

    @present ||= presenter_class.new(self)
  end

  private

  def presenter_class
    nil
  end
end
