# frozen_string_literal: true

# Handles all errors within entire app
module Errors
  module Logger
    # Reports error to log with backtrace
    # @param error [StandardError]
    # @param custom_message [String]
    # @param tags [Array]
    def log_error(error, custom_message: nil, tags: [])
      logger.tagged(*tags) { logger.error(prepared_error_message(error, custom_message)) }
    end

    # Reports info message to log
    # @param info_message [String]
    # @param tags [Array]
    def log_info(info_message, tags: [])
      logger.tagged(*tags) { logger.info(info_message) }
    end

    # Reports debug message to log
    # @param debug_message [String]
    # @param tags [Array]
    def log_debug(debug_message, tags: [])
      logger.tagged(*tags) { logger.debug(debug_message) }
    end

    # Reports warning message to log
    # @param tags [Array]
    def log_warn(warn_message, tags: [])
      logger.tagged(*tags) { logger.warn(warn_message) }
    end

    # Prepares error message
    # @param error [StandardError]
    # @param custom_message [String]
    def prepared_error_message(error, custom_message = nil)
      return custom_message unless error

      backtrace = error.backtrace.nil? ? 'trace is empty' : error.backtrace.join("\n\t")
      backtrace = "[#{Time.zone.now.strftime('%FT%T%:z')}]\n#{backtrace}"
      return "#{custom_message}\n#{error.class}: #{error.message}\n#{backtrace}" if custom_message.present?

      "#{error.class}: #{error.message}\n#{backtrace}"
    end

    def logger
      @logger ||= ActiveSupport::TaggedLogging.new(Rails.logger)
    end

    def filter_string(string, regex)
      Array.wrap(regex).each do |r|
        string.gsub!(r, '**FILTERED**')
      end
      string
    end
  end
end
