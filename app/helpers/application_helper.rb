module ApplicationHelper
  def user_avatar(user)
    if user.avatar.attached?
        user.avatar
    else
        'default_avatar.png'
    end
  end
end
