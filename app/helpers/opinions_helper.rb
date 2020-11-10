module OpinionsHelper
  def get_opinion_count(opinion)
    total_up_votes = opinion.votes.where(vote_type: 'up').count
    total_down_votes = opinion.votes.where(vote_type: 'down').count
    total_up_votes - total_down_votes
  end

  def show_vote_buttons(opinion, opinion_owner_user)
    route = opinion_owner_user.nil? ? "opinions" : "user_profile"

    if current_user.id != opinion.user.id
      content_tag :div,nil, :class => "vote_container flex-shrink-1 d-flex flex-column" do
        concat( link_to '<h4><i class="fas fa-arrow-up a-2x"></i></h4>'.html_safe, vote_path({opinion: opinion, voter: current_user, vote_direction: "up", route: route } ), :class => "text-dark")
        concat( content_tag (:h4), get_opinion_count(opinion), :class => "text-dark")
        concat( link_to '<h4><i class="fas fa-arrow-down a-2x"></i></h4>'.html_safe, vote_path({opinion: opinion, voter: current_user, vote_direction: "down", route: route }), :class => "text-dark")
      end
    else

      content_tag :div,nil, :class => "vote_container flex-shrink-1 d-flex flex-column" do
        concat( '<h4><i class="fas fa-arrow-up a-2x text-black-30"></i></h4>'.html_safe)
        concat( content_tag (:h4), get_opinion_count(opinion), :class => "text-dark")
        concat ( '<h4><i class="fas fa-arrow-down a-2x text-black-30"></i></h4>'.html_safe )
      end

    end
  end

  def show_edit_destroy_opinion_buttons(opinion)
    if current_user.id == opinion.user.id
      content_tag :div,nil, :class => "d-flex justify-content-end flex-row" do
        concat( link_to '<p class="mr-2">Edit</p>'.html_safe, edit_opinion_path(opinion) )
        concat( link_to '<p>Destroy</p>'.html_safe, opinion, method: :delete, data: { confirm: 'Are you sure?' })
      end
    else
      return
    end

  end
end
