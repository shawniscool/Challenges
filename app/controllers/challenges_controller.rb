class ChallengesController < ApplicationController
  def new
  	@challenge = Challenge.new
  end

  def create
  	@challenge = Challenge.new
  end
end
