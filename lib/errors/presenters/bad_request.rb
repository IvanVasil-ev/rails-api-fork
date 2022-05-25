# frozen_string_literal: true

module Errors
  module Presenters
    class BadRequest < Errors::AbstractPresenter
      EXCEPTIONS = %w[
        ActionController::ParameterMissing
      ].freeze

      def response_data_action_controller_parameter_missing
        { param: error.param.to_s }
      end
    end
  end
end
