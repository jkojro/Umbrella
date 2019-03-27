class ApplicationController < ActionController::Base
  rescue_from StandardError, with: -> { render_error 500 }

  rescue_from ActiveRecord::RecordNotFound, with: -> { render_error 404 }

  private

  def render_error(status_number)
    render file: "#{Rails.root}/public/#{status_number}", layout: 'layouts/application', status: status_number
  end
end
