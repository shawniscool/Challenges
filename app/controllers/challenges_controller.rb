class ChallengesController < ApplicationController
  def new
  	@challenge = Challenge.new
  end

  def create
  	@challenge = Challenge.new(user_params)
  	if @challenge.save
  		flash[:success] = "You have successfully created the challenge."
  		redirect_to root
  	else
  		render 'new'
  	end
  end

  private
  	def user_params
  		params.require(:challenge).permit(:name, :task)
  	end

end
