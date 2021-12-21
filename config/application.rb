require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Zinnia
  class Application < Rails::Application
    config.load_defaults 6.1

    config.time_zone = "Tokyo"
    config.i18n.load_path +=
      Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}").to_s]
    config.i18n.default_locale = :ja

    config.generators do |g|
      g.test_framework :rspec,
        view_specs: false,
        helper_specs: false,
        routing_specs: false
    end
  end
end
