class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show

  def index
    @users = User.order(:first_name)
  end

  def show
    @user = User.find(params[:id])
    @public_locations = @user.user_locations.public_locations
  end

  def share_location
    if params[:is_public].present?
      current_user.user_locations.create(is_public: true, latitude: params[:latitude].to_f, longitude: params[:longitude].to_f)
    else
      emails = params[:emails].split(',').map(&:strip)

      if emails.present?
        location = current_user.user_locations.create(is_public: false, latitude: params[:latitude].to_f, longitude: params[:longitude].to_f)
      end

      emails.each do |email|
        user = User.find_by_email(email)
        if user
          user.shared_locations.create(user_location_id: location.id)
        end
      end
    end

    redirect_to root_path
  end
end
