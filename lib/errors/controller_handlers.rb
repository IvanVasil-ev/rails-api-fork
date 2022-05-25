# frozen_string_literal: true

module Errors
  module ControllerHandlers
    extend ActiveSupport::Concern

    ERROR_PRESENTERS = %w[
      UnprocessableEntity
      UnexpectedError
      Unauthorized
      BadRequest
      Forbidden
      NotFound
    ].freeze

    included do
      include Errors::Logger

      Errors::Registry.new(ERROR_PRESENTERS).exceptions.each do |error_class, presenter_class|
        rescue_from error_class do |error|
          Rails.logger.error(([error.message] + error.backtrace).join($RS))
          presenter = presenter_class.new(error)
          log_error(error)
          render_error_response(presenter.build_response, presenter.http_status)
        end
      end
    end

    protected

    def render_error_response(data = {}, http_code = 500)
      render json: data, status: http_code
    end
  end
end
