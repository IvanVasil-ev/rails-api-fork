# frozen_string_literal: true

module Errors
  module Presenters
    class UnexpectedError < Errors::AbstractPresenter
      EXCEPTIONS = %w[
        ActiveRecord::StatementInvalid
        StandardError
      ].freeze

      def response_message_active_record_statement_invalid
        'UNEXPECTED_ERROR'
      end
    end
  end
end
