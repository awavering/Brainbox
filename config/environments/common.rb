Rails.logger.info "Loading environment: common"

Brainbox::Application.configure do

  # for devise
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  # On config/application.rb forcing your application to not access the DB
  # or load models when precompiling your assets.
  # config.assets.initialize_on_precompile = false

  # TODO: make this more secure, somehow.  load permissions from hashed file?
  # config.permissions = YAML::load_stream File.open "config/school_permissions.yml"

  # autoload lib path
  config.autoload_paths += %W(#{config.root}/lib)
end
