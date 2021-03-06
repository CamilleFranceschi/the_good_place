require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"
# Cloudinary
require "attachinary/orm/active_record"  # <= Add this line

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TheGoodPlace
  class Application < Rails::Application
    # Added for remote true
    config.action_view.embed_authenticity_token_in_remote_forms = true

    config.generators do |generate|
      generate.assets false
      generate.helper false
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # config.action_dispatch.default_headers = {
    #   'Access-Control-Allow-Origin' => '*',
    #   'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(",")
    # }
    config.action_dispatch.default_headers.merge!({
      'Access-Control-Allow-Origin' => '*',
      'Access-Control-Request-Method' => '*'
    })
  end
end
