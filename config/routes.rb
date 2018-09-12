Rails.application.routes.draw do
  devise_for :users
  get "signed_in", to: "welcome#signed_in"
  root :to => "welcome#index"
end
