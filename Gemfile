source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'mysql2'
gem "yettings"

# Commenting this out because we're not going to pre-compile assets for now
#group :assets do
  gem 'sass-rails',   '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.2'

  gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
#end

gem 'jbuilder'
gem 'ya2yaml'

gem 'themes_for_rails'

gem 'jquery-rails', '~> 2.1.4'
gem 'jquery-ui-rails'
gem 'slim'

gem 'authlogic'

gem 'bcrypt-ruby', '~> 3.0.0'

gem 'unicorn'

group :development do
	gem 'quiet_assets'
	gem 'thin'
	gem 'thor'
end

gem 'pluginfactory'

# this is explicitly needed in fedora 18 -- somehow it's screwed up and needed for the rails console to work
gem 'minitest'

gem "rspec-rails", :group => [:test, :development]
group :test do
  gem "sqlite3"
  gem "factory_girl_rails"
  gem "capybara"
  gem 'capybara-screenshot'
  # FIXME: required for Fedora 18
  gem 'minitest'
  #required for javascript test in selenium
  gem 'poltergeist'

  gem 'simplecov', :require => false, :group => :test
end

