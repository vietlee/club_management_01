require_relative "boot"
require "rails/all"
require "carrierwave"
require "carrierwave/orm/activerecord"
require "roo"
require "activerecord-import/base"
ActiveRecord::Import.require_adapter("mysql2")
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
module Clubmanagement
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/lib)
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = :vi
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.middleware.use I18n::JS::Middleware
    config.assets.precompile += Ckeditor.assets
    config.assets.precompile += %w(ckeditor/*)
    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
    config.time_zone = "Hanoi"
  end
end
