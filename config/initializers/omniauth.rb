Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           Rails.application.credentials.google[:key],
           Rails.application.credentials.google[:secret]

  provider :twitter,
           Rails.application.credentials.twitter[:key],
           Rails.application.credentials.twitter[:secret]
end