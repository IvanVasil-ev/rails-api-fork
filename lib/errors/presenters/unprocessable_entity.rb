# frozen_string_literal: true

module Errors
  module Presenters
    class UnprocessableEntity < Errors::AbstractPresenter
      EXCEPTIONS = %w[
        ActiveRecord::RecordNotFound
        ActiveRecord::RecordNotSaved
        ActiveRecord::RecordNotDestroyed
        ActiveRecord::RecordInvalid
      ].freeze

      def response_data_active_record_record_invalid
        error.record.errors.details
      end
    end
  end
end
