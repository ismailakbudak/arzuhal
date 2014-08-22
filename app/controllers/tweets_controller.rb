class TweetsController < ApplicationController
	
	def show
	end
    
    def create
    	@user = User.find(params[:user_id])
    	@tweet = @user.tweets.new(tweet_params)
    	if @tweet.save
    	     redirect_to @user, notice: "Tweet was created successfuly.."
    	else
    		 @tweets = @user.tweets.order(created_at: :desc).paginate(page: params[:page])
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
