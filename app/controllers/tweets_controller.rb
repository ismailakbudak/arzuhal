class TweetsController < ApplicationController
	
	def show
	end
    
    def create
    	@user = User.find(params[:user_id])
    	@tweet = @user.tweets.create(tweet_params) 
        redirect_to @user
    end

	def destroy
		@user = User.find(params[:user_id])
    	@tweet = @user.tweets.find(params[:id])
    	@tweet.destroy
        redirect_to @user  
	end

	private
	   def tweet_params
	   	    params.require(:tweet).permit(:tweet) 
	   end

end
