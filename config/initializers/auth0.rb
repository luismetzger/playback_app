Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'eMAgoBH8Bou1eDuASFBPK5tBDrso3FOs',
    'gzx8mLvnKwOvF_WHXoVsuIEAJFk_jbenFAoHPuABqnepLYwAnyyNPUgcHNZbCh1I',
    'playback.auth0.com',
    callback_path: "/auth/auth0/callback"
  )
end
