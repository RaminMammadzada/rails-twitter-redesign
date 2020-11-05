class OpinionsController < ApplicationController
  before_action :set_opinion, only: [:show, :edit, :update, :destroy]
  # GET /opinions
  # GET /opinions.json
  def index
    login_required
    # @opinions = Opinion.all
    @opinion = Opinion.new()
    # @opinion.authorId = get_current_user.id
    timeline_opinions
  end

  # GET /opinions/1
  # GET /opinions/1.json
  def show
  end

  # GET /opinions/new
  def new
    @opinion = Opinion.new
  end

  # GET /opinions/1/edit
  def edit
  end

  # POST /opinions
  # POST /opinions.json
  def create
    @opinion = Opinion.new(opinion_params)
    @opinion.authorId = get_current_user.id

    respond_to do |format|
      if @opinion.save
        format.html { redirect_to opinions_path, notice: 'Opinion was successfully created.' }
        format.json { render :show, status: :created, location: @opinion }
      else
        format.html { render :new }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opinions/1
  # PATCH/PUT /opinions/1.json
  def update
    respond_to do |format|
      if @opinion.update(opinion_params)
        format.html { redirect_to @opinion, notice: 'Opinion was successfully updated.' }
        format.json { render :show, status: :ok, location: @opinion }
      else
        format.html { render :edit }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.json
  def destroy
    @opinion.destroy
    respond_to do |format|
      format.html { redirect_to opinions_url, notice: 'Opinion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_vote
    current_opinion_id = params[:opinion]
    current_voter_id = params[:voter]
    vote_direction = params[:vote_direction]
    route = params[:route]
    p "DEBUG3:#{current_opinion_id}"
    p "DEBUG4:#{current_voter_id}"
    current_opinion = Opinion.find_by(id: current_opinion_id)
    current_voter = User.find_by(id: current_voter_id)
    p "DEBUG5:#{current_opinion.votes}"
    p "DEBUG6:#{current_voter.votes}"
    p "DEBUG7:#{params}"

    if vote_direction == "up"
      current_opinion.votes.create(voter_id: current_voter.id)
    elsif vote_direction == "down"
      current_opinion.votes.find_by(voter_id: current_voter.id).destroy
    end


    respond_to do |format|
      if route == "opinions"
        format.html { redirect_to opinions_url, notice: 'The vote is updated' }
        format.json { head :no_content }
      elsif route == "user_profile"
        format.html { redirect_to user_path(current_opinion.user.id), notice: 'The vote is updated' }
        format.json { head :no_content }
      end
    end
  end

  private
    def timeline_opinions
      @timeline_opinions ||= Opinion.all.order(created_at: :desc).includes(:user)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_opinion
      @opinion = Opinion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def opinion_params
      params.require(:opinion).permit(:authorId, :text)
    end

end
