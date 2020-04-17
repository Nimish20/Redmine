Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV[GOOGLE_API_KEY] , ENV[GOOGLE_SECRET_KEY]
  provider :facebook, ENV[FACEBOOK_API_ID] , ENV[FACEBOOK_API_KEY]
end