class StaticPagesController < ApplicationController
  def home
  	if logged_in?
  		@challenge = current_user.challenges.build
  		@feed_items = current_user.feed
  		
  		@feed_users = @challenge.feed
  	end
  end
end
