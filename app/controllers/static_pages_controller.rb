class StaticPagesController < ApplicationController
  def home
  	if logged_in?
  		@challenge = current_user.challenges.build
  		@feed_items = current_user.feed
  	end
  end
end
