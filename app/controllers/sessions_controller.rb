class SessionsController < ApplicationController
  def Auth
    # Get access tokens from the google server
    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)
    #log_in(user)
    # Access_token is used to authenticate request made from the rails application to the google server
    #user.google_token = access_token.credentials.token
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
    refresh_token = access_token.credentials.refresh_token
    #user.google_refresh_token = refresh_token if refresh_token.present?
    user.activate
    user.last_login_on = Time.now
    user.mail_notification = 'all'
    random_password = SecureRandom.hex(10)
    user.password = random_password
    user.must_change_passwd = true
    if user.save!
      Mailer.account_information(user, random_password).deliver
      self.logged_user = user
      redirect_to my_account_path
    end
  end
end
