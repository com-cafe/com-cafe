source 'http://rubygems.org'

gem 'rails', '4.0.0.rc2'
gem 'mongoid', github: 'mongoid/mongoid'
gem 'tire'
gem 'unicorn'

gem 'sass-rails', '~> 4.0.0.rc2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'bootstrap-sass', git: 'git://github.com/thomas-mcdonald/bootstrap-sass.git', branch: '3'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'brakeman', require: false
  gem "rails_best_practices", require: false
end

group :test, :development do
  gem 'rspec-rails'
  gem 'debugger'
end
