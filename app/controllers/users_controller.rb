class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @public_locations = @user.user_locations.public_location
  end

  def share_location
    if params[:is_public].present?
      current_user.user_locations.create(is_public: true, latitude: params[:latitude].to_f, longitude: params[:longitude].to_f)
    end

    redirect_to root_path
  end
end
