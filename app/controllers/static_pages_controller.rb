class StaticPagesController < ApplicationController
  
  def home
  	@tweets = Tweet.all.order(created_at: :desc)
  end

  def about
  end

  def help
  end

  def contact
  end

end
