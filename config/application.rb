require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)
Dotenv::Railtie.load

module RailsServerApi
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec
    end

    config.load_defaults 7.0
    config.action_mailer.preview_path = "#{config.root}/spec/mailers/previews"
    config.support_email = 'main@example.com'

    config.eager_load_paths += %W[#{config.root}/lib]
    config.autoload_paths += %W[#{config.root}/lib]
    config.autoload_paths += %W[#{config.root}/app/services]
    config.autoload_paths += %W[#{config.root}/app/presenters]


    config.api_only = true
  end
end
