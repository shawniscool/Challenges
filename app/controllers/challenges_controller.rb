class ChallengesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
    @challenge = current_user.challenges.new
  end

  def create
  	@challenge = current_user.challenges.build(challenge_params)
  	if @challenge.save
  		flash[:success] = "Challenge posted"
  		redirect_to root_url
  	else
  		@feed_items = []
  		render 'static_pages/home'
  	end
  end

  def destroy
  	@challenge.destroy
    flash[:success] = "Challenge deleted"
    redirect_to request.referrer || root_url
  end

  private

    def challenge_params
      params.require(:challenge).permit(:task, :title)
    end

    def correct_user
      @challenge = current_user.challenges.find_by(id: params[:id])
      redirect_to root_url if @challenge.nil?
    end
end