class TweetsController < ApplicationController
  
  def index
      
    @q = Tweet.ransack(params[:q])
    if user_signed_in?
      @followings = current_user.followings.pluck(:followed_id )
      @tweets = Tweet.tweets_for_me(@followings).order(created_at: :desc).page(params[:page])
      @tweet = Tweet.new
    else 
      @tweets = Tweet.order(created_at: :desc).page(params[:page])
      @tweet = Tweet.new
    end
      
    @tweet = Tweet.new

    @tweets = if params.has_key? :search
                @tweets.where("content LIKE '%#{params[:search]}%'")
              else
                @tweets
              end
  end

  def searching_tweet
    @q = Tweet.ransack(params[:q])
    @tweet_search = @q.result(distinct: true)
  end

  def new
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id]) 
  end

  def edit
  end

  def create
    @tweet = Tweet.create(tweet_params)
    @tweet.user = current_user
    
    if @tweet.save
      flash[:notice] = "Tu Tweet ha sido creado"      
    else
      flash[:notice] = "el tweet no se creo"      
    end
    redirect_to "/tweets"
  end

  def update
  end

  def destroy
  end

  def all_tweets
    if user_signed_in?
      @tweets = Tweet.order(created_at: :desc).page(params[:page])
      @tweet = Tweet.new
    else 
      @tweets = Tweet.order(created_at: :desc).page(params[:page])
      @tweet = Tweet.new
    end 
    @tweets = if params.has_key? :search
      @tweets.where("content LIKE '%#{params[:search]}%'")
    else
      @tweets
    end
  end

  private
  

  def tweet_params
    params.require(:tweet).permit(:content, :image_url)
  end
end
