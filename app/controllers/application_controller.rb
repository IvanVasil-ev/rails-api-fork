# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ::Errors::ControllerHandlers

  private

  def render_response(data = {}, http_code = 200)
    render json: data, status: http_code
  end
end
