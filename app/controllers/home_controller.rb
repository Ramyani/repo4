class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @my_locations = current_user.user_locations
    @shared_locations = current_user.shared_user_locations
  end
end
