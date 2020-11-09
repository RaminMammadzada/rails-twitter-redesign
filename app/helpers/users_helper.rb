module UsersHelper
  def gel_all_unfollowed_users(user = current_user)
    all_users = User.order(created_at: :desc).all.where.not(id: user.id)
    all_users - user.followeds
  end

  def get_all_followers(user = current_user)
    user.followers
  end

  def get_all_followed_users(user = current_user)
    user.followeds
  end

  def first_follower(user)
    first_follower = user.followers.first
    first_follower.nil? ? nil : first_follower.fullname
  end

  def follow_button(user)
    if user.id == current_user.id
      icon = content_tag(:i, nil, class: 'fas fa-plus-circle fa-2x hide-icon')
      return capture do
        icon
      end
    end
    if Following.all.where(followerId: current_user.id, followedId: user.id).empty?
      icon = content_tag(:i, nil, class: 'fas fa-plus-circle fa-2x')

      capture do
        link_to icon, followings_path(
          following: {
            followerId: current_user.id,
            followedId: user.id,
            route: opinions_path
          }
        ),
                method: 'post',
                class: 'follow-button',
                id: 'follow-button'
      end
    else
      # icon = content_tag(:p, "unfollow")
      icon = content_tag(:i, nil, class: 'fas fa-minus-circle fa-2x')
      capture do
        link_to icon, following_path(
          id: user.id,
          route: opinions_path
        ),
                method: 'delete',
                class: 'follow-button',
                id: 'follow-button'
      end
    end
  end

  def settings_button(user)
    icon = content_tag(:i, nil, class: 'fas fa-cog fa-2x')
    if user.id == current_user.id
      capture do
        link_to icon, edit_user_path(user)
      end
    else
      capture do
        icon
      end
    end
  end

  def get_title(flag)
    if flag == 'followers'
      'Followers'
    elsif flag == 'followed_users'
      'Followed users'
    end
  end
end
