require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Wingle
  class Application < Rails::Application
    config.facebook_app = config_for(:facebook_app)
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.enforce_available_locales = true
    config.i18n.default_locale = :'pt-BR'
    config.i18n.locale = :'pt-BR'
  end
end
