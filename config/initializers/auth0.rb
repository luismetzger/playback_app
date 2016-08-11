Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    ENV['CLIENT_ID'],
    ENV['SECRET_KEY'],
    'playback.auth0.com',
    callback_path: "/auth/auth0/callback"
  )
end
