# frozen_string_literal: true

require_relative './errors/abstract_presenter'
require_relative './errors/registry'

module Errors
  class PostNotFound < StandardError
    def message
      'POST_NOT_FOUND'
    end
  end

  class UserNotFound < StandardError
    def message
      'USER_NOT_FOUND'
    end
  end

  class ParameterMissing < StandardError
    attr_reader :params

    def initialize(*params)
      @params = params
      super(message)
    end

    def message
      "PARAMETER_MISSING: #{@params.join(', ')}"
    end
  end
end
