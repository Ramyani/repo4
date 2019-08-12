module HomeHelper
  def link_to_user(user)
    link_to user.first_name, user_path(user), target: :blank
  end
end
