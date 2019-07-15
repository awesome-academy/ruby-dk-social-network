require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "carrierwave"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module RubyDkSocialNetwork
  class Application < Rails::Application
    config.load_defaults 5.2

    I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]

    I18n.available_locales = [:en, :vi]

    I18n.default_locale = :en

    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
