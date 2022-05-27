🚨🚨🚨

**This demo is no longer actively maintained.** The Authy API has been replaced with the [Twilio Verify API](https://www.twilio.com/docs/verify). Twilio will support the Authy API through November 1, 2022 for SMS/Voice. After this date, we’ll start to deprecate the service for SMS/Voice. Any requests sent to the API after May 1, 2023, will automatically receive an error.  Push and TOTP will continue to be supported through July 2023.

[Learn more about migrating from Authy to Verify.](https://www.twilio.com/blog/migrate-authy-to-verify)

Please visit the Twilio Docs for:
* [Verify + Ruby (Rails) quickstart](https://www.twilio.com/docs/verify/quickstarts/ruby-rails)
* [Twilio Ruby helper library](https://www.twilio.com/docs/libraries/ruby)
* [Verify API reference](https://www.twilio.com/docs/verify/api)

Please direct any questions to [Twilio Support](https://support.twilio.com/hc/en-us). Thank you!

🚨🚨🚨

---

# Authy Devise Demo

This is a demo of using [Devise](https://github.com/plataformatec/devise) and [Authy](https://www.twilio.com/docs/authy) together with the [`authy-devise`](https://github.com/twilio/authy-devise) gem to add two factor authentication to a Rails application.

## Running this demo

This demo was built with Ruby 2.5.1, but should run with any Ruby version that is supported by Rails/Devise.

To run this application download or clone it from GitHub, change into the directory and install the dependencies:

```bash
git clone https://github.com/twilio/authy-devise-demo.git
cd authy-devise-demo
bundle install
```

Create and migrate the database:

```bash
rails db:create db:migrate
```

Get your Authy application API key from the [Twilio console](https://www.twilio.com/console/authy/applications) and set it in your environment variables:

Through CLI:

```bash
export AUTHY_API_KEY=YOUR_API_KEY
```

Or in .env:

```bash
cp .env{.example,}
```

Place API key in .env file generated from above command.

Run the Rails application:

```bash
rails server
```

Visit [localhost:3000](http://localhost:3000) and sign up as a new user.


## Building this demo yourself

1. Create a new Rails application

   ```bash
   rails new authy-devise-demo
   cd authy-devise-demo
   ```

2. Generate a controller

   ```bash
   rails generate controller welcome index signed_in
   ```

3. Add a root path and signed in path to your `config/routes.rb`

   ```ruby
   Rails.application.routes.draw do
     get "signed_in", to: "welcome#signed_in"
     root :to => 'welcome#index'
   end
   ```

4. Update the root and signed in views

   ```erb
   # app/views/welcome/index.html.erb
   <h1>Welcome to the sample app</h1>
   <p><%= link_to "Sign up", new_user_registration_path %></p>
   <p><%= link_to "Sign in", new_user_session_path %></p>
   ```

   ```erb
   # app/views/welcome/signed_in.html.erb
   <h1>Welcome to the sample app</h1>
   <p>You are signed in as <%= current_user.email %></p>
   ```

5. Add the `devise` and `devise-authy` gems to your `Gemfile` and install

   ```ruby
   gem 'devise', '~> 4.5'
   gem 'devise-authy', '~> 1.9'
   ```

   ```bash
   bundle install
   ```

6. Install devise

   ```bash
   rails generate devise:install
   ```

7. Add flash messages to the `app/views/layouts/application.html.erb` and update the default URL options in `config/environments/development.rb`

   ```html
   <p class="notice"><%= notice %></p>
   <p class="alert"><%= alert %></p>
   ```

   ```ruby
   config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
   ```

8. Generate a user model with Devise and migrate the database

   ```bash
   rails generate devise User
   rails db:migrate
   ```

8. Edit `app/controllers/welcome_controller.rb` and add:

   ```ruby
   class WelcomeController < ApplicationController
     before_action :authenticate_user!, only: :signed_in

     def index
       redirect_to signed_in_path if user_signed_in?
     end

     def signed_in
     end
   end
   ```

9. Install `authy-devise`

   ```bash
   rails generate devise_authy:install
   ```

10. Open `config/initializers/authy.rb` and add your Authy API key (generate one in the [Twilio Console](https://www.twilio.com/console/authy/applications))

    ```ruby
    Authy.api_key = "YOUR_API_KEY"
    Authy.api_uri = "https://api.authy.com/"
    ```

11. Add `authy-devise` to the `User` model and run the resulting migration

    ```bash
    rails generate devise_authy User
    rails db:migrate
    ```

12. Run the server and visit http://localhost:3000/users/sign_up to create a user

    ```bash
    rails server
    ```

13. When signed in, visit http://localhost:3000/users/enable_authy to enable 2FA

14. Sign out and sign back in again and you will be required to enter your 2FA token