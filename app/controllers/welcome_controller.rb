class WelcomeController < ApplicationController
  before_action :authenticate_user!, only: :signed_in

  def index
    redirect_to signed_in_path if user_signed_in?
  end

  def signed_in
  end
end
