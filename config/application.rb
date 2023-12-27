require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MenuPlanner
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    
    # 下に追加
    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]
    
    #simple_calendarの表示をカスタマイズ　/MenuPlanner/config/locales/simple_calendar.yml
    config.i18n.default_locale = :ja
    

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
