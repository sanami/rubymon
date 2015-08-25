class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.omniauth_facebook(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      redirect_on_error
    end
  end

  private

  def redirect_on_error
    # redirect_to new_user_registration_url, alert: @user.errors.full_messages.join('. ')
    redirect_to dashboard_path, alert: @user.errors.full_messages.join('. ')
  end
end
