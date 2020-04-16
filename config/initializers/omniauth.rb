Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "720115713691-0tnth2211fl3eg2h53cpupuogrt9aai4.apps.googleusercontent.com" , "e1_TYGrpOontomOUA3lqNjOl"
  provider :facebook, "2564654387122219" , "57deb9a7689eb102f5ea6bbb88ec1d03"
end