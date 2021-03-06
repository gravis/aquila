require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

begin
  require 'pry'
rescue LoadError
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Aquila
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run 'rake -D time' for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.default_locale = :fr
    config.i18n.available_locales = [:en, :fr]
    config.i18n.enforce_available_locales = false
    I18n.config.enforce_available_locales = false

    # less-rails gem (default all generators)
    config.app_generators.stylesheet_engine :less
    # config.app_generators.template_engine :slim

    config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')

    config.generators do |g|

      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'

      g.view_specs true
      g.helper_specs true

      g.template_engine :slim
    end

    config.action_dispatch.rescue_responses['ApplicationController::Forbidden'] = :forbidden
    config.exceptions_app = self.routes
  end
end
