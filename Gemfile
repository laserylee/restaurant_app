source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.6.3'
gem 'rails', '~> 5.2.2'                                         # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'puma', '~> 3.7'                                            # Use Puma as the app server
gem 'sass-rails', '~> 5.0'                                      # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'                                      # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.2'                                    # Use CoffeeScript for .coffee assets and views
gem 'jquery-rails'
gem 'turbolinks', '~> 5'                                        # Turbolinks makes navigating your web application faster. Read
                                                                # more: https://github.com/turbolinks/turbolinks
gem 'jbuilder', '~> 2.5'                                        # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'bcrypt', '~> 3.1.7'                                        # Use ActiveModel has_secure_password
gem 'bootstrap', '~> 4.3.1'
gem 'bootstrap-will_paginate'
gem 'carrierwave'                                               # Upload stuff
gem 'mini_magick'                                               # Edit picture
gem 'devise'                                                    # Authentication
gem 'faker'                                                     # Faker~

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# gem 'redis', '~> 4.0'                                         # Use Redis adapter to run Action Cable in production
# gem 'capistrano-rails', group: :development                   # Use Capistrano for deployment

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]           # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'annotate'
# gem 'capybara', '>= 2.15'                                     # Adds support for Capybara system testing and selenium driver
# gem 'selenium-webdriver'
end

group :development do
  gem 'sqlite3'                                                   # Use sqlite3 as the database for Active Record
  gem 'web-console', '>= 3.3.0'                                 # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'                                                  # Spring speeds up development by keeping your application running in the 
  gem 'spring-watcher-listen', '~> 2.0.0'                       # background. Read more: https://github.com/rails/spring 
end

group :test do
  gem 'rails-controller-testing'
end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
