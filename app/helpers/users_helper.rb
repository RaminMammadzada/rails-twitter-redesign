module UsersHelper
  def gel_all_unfollowed_users(user = current_user)
    all_users = User.order(created_at: :desc).all.where.not(id: user.id)
    followed_users = Following.all.where(followerId: user.id)
    all_users - user.followeds
  end

  def first_follower(user)
    first_follower = user.followers.first
    first_follower.nil? ? nil : first_follower.fullname
  end

  def follow_button(user)
    return if user.id == current_user.id
    if Following.all.where(followerId: current_user.id, followedId: user.id).empty?
      icon = content_tag(:i, nil, class: 'fas fa-plus-circle fa-2x')
      # icon = content_tag(:p, "follow")

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
end
