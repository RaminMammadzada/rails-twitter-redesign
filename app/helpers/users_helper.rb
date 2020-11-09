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
    first_follower.nil? ? nil : first_follower
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

  def display_errors(user)

    return unless user.errors.full_messages.any?

    if user.errors.any?
      concat content_tag :h2, pluralize(user.errors.count, "error") + " prohibited this user from being saved:", class: 'errors'

       content_tag (:ul), class: "input_validations" do
        user.errors.full_messages.each do |message|
          concat content_tag (:li) , message, class: "errors"
        end.reduce(&:+)
      end
    end
  end

  def show_login_button(current_user)
    if !current_user
      concat content_tag (:p), "go back to", class: "mr-2"
      link_to("Log In", login_url, :class => "btn btn-primary text-white")
    end

  end

  def print_first_follower(user)
    first_follower_of_user = first_follower(user)
    if first_follower(user)
      concat content_tag (:p), "Followed by "
      link_to( first_follower_of_user.fullname, user_path(first_follower_of_user.id), :class => "text-primary")
    else
      return
    end
  end

end
