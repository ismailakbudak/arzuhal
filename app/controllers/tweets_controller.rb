class TweetsController < ApplicationController
	
	def show
	end
    
    def create
    	@user = User.find(params[:user_id])
    	@tweet = @user.tweets.new(tweet_params)
    	if @tweet.save
    	     redirect_to @user
    	else
    		 @tweets = @user.tweets.order(created_at: :desc).limit(3)
             render "users/show"
    	end 
        
    end
    
    def show
    	@user = User.find(params[:user_id])
    	@tweet = @user.tweets.find(params[:id])
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
