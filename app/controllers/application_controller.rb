class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # CanCan
  check_authorization unless: :skip_authorization?
  rescue_from CanCan::AccessDenied, with: :access_denied

  private

  def skip_authorization?
    devise_controller?
  end

  # Called by CanCan
  def access_denied(ex)
    Rails.logger.debug { "Access denied on #{ex.action} #{ex.subject.inspect}" }

    if request.xhr?
      render json: { message: 'Access denied' }, status: :forbidden
    else
      if current_user.nil?
        redirect_to authenticate_user!, alert: 'You have to log in to continue'
      else
        redirect_to main_app.root_url, alert: 'Access denied'
      end
    end
  end

  def respond_with_errors(model, ex)
    render json: { message: ex.try(:message), errors: model.try(:errors) }, status: :unprocessable_entity
  end

  def log_error(ex)
    Rails.logger.error ex.inspect
    Rails.logger.error ex.backtrace.join("\n")
  end
end
