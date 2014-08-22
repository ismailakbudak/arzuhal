class StaticPagesController < ApplicationController
  
  def home
  	@tweets = Tweet.all.order(created_at: :desc).paginate(page: params[:page])
  end

  def about
  end

  def help
  end

  def contact
  end

end
