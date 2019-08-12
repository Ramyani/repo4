module HomeHelper
  def link_to_user(user)
    link_to user.first_name, user_path(user), target: :blank
  end

  def location_setting(location)
    if location.is_public?
      'Public'
    else
      location.users.map(&:email).join(', ')
    end
  end
end
