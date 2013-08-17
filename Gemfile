source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyrhino'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

if RUBY_PLATFORM =~ /java/
  gem 'activerecord-jdbcsqlite3-adapter', '~> 1.3.0.beta2'
else
  group :development, :test do
    gem 'sqlite3'
  end
  group :production do
    gem 'pg'
  end
end

gem 'rails_12factor', group: :production

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

gem 'devise', '~> 3.0.0rc'
gem 'bootstrap-sass', '~> 2.2.2.0'
gem 'client_side_validations', git: 'git://github.com/bcardarella/client_side_validations.git', branch: '4-0-beta' # return to main gem when it's out of beta
gem 'validates_timeliness', '~> 3.0.14'

# development and testing
gem 'factory_girl_rails'
gem 'faker'

gem 'protected_attributes'