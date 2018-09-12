# Authy Devise Demo

This is a demo of using [Devise](https://github.com/plataformatec/devise) and [Authy](https://www.twilio.com/docs/authy) together with the [`authy-devise`](https://github.com/authy/authy-devise) gem to add two factor authentication to a Rails application.

## Running this demo

TODO

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Building this demo yourself

1. Create a new Rails application

  ```bash
  rails new authy-devise-demo
  cd authy-devise-demo
  ```

2. Generate a controller

  ```bash
  rails generate controller welcome index
  ```

3. Add the root path to your `config/routes.rb`

  ```ruby
  Rails.application.routes.draw do
    root :to => 'welcome#index'
  end
  ```

4. Add the `devise` and `devise-authy` gems to your `Gemfile` and install

  ```ruby
  gem 'devise', '~> 4.5'
  gem 'devise-authy', '~> 1.9'
  ```

  ```bash
  bundle install
  ```