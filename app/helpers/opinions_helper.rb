module OpinionsHelper
  def get_opinion_count(opinion)
    total_up_votes = opinion.votes.where(vote_type: "up").count
    total_down_votes = opinion.votes.where(vote_type: "down").count
    total_up_votes - total_down_votes
  end
end
