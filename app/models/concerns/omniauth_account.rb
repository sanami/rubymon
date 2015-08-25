module OmniauthAccount
  extend ActiveSupport::Concern

  module ClassMethods
    # Facebook OAuth2
    def omniauth_facebook(auth)
      omniauth_oauth2(auth)
    end

    private

    def omniauth_oauth2(auth)
      ap auth
      info = auth[:info]
      user_auth = Authentication.find_by provider: auth[:provider], uid: auth[:uid]
      user = user_auth.try :user
      if user
        # Update profile
      else
        user = User.by_email(info[:email]).first
        if user
          # Registered with email
        else
          # New user
          user = User.create email: info[:email] do |user|
            user.password = Devise.friendly_token.first(8)
            user.full_name = info[:name]
            user.skip_confirmation! # skip confirmation email
          end
        end

        user.authentications.create provider: auth[:provider], uid: auth[:uid], auth_info: auth.to_hash
      end
      user.skip_confirmation!

      user.save
      user
    end
  end
end
