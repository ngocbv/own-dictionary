source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.6.3'

gem 'rails', '~> 5.1.4'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'httparty'
gem 'figaro'
gem 'bootstrap', '~> 4.0.0'
gem 'haml-rails', '~> 1.0'
gem 'jquery-rails'
gem 'devise', '~> 4.4.3'
gem 'airbrake-ruby', '~> 2.8'
gem 'metamagic'
gem 'gretel'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.7'
  gem 'faker'
  gem 'factory_bot_rails'
  gem 'simplecov', require: false
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'bullet'
end

group :test do
  gem 'database_cleaner'
  gem 'cucumber-rails', :require => false
  gem 'selenium-webdriver'
  gem 'launchy' # to use save_and_open_page
  gem 'capybara', '~> 2.7', '>= 2.7.1'
  gem 'capybara-screenshot'
  gem 'fuubar' # progress bar when run rspec
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', '~> 3.1'
end

gem 'pg'

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
