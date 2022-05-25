# frozen_string_literal: true

module Errors
  module Presenters
    class NotFound < Errors::AbstractPresenter
      EXCEPTIONS = %w[
        Errors::PostNotFound
        Errors::UserNotFound
      ].freeze
    end
  end
end
