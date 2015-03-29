OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "525335477607885", "92173db9d4890c2df43a144d51fddd8c"
end