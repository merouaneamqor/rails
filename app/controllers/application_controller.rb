class ApplicationController < ActionController::Base
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from ActiveRecord::RecordNotFound,   with: :render_404
  
    def render_404
      redirect_to '/404'
    end
  end
  