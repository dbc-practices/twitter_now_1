get '/' do
  erb :index
end

# get '/:username' do
#   @user = TwitterUser.where(username: params[:username]).first_or_create
#   # user.refresh_if_stale
#   @recent_tweets = @user.tweets.order(created_at: :desc).limit(10)
#   erb :recent
# end

# post '/refresh_cache' do
#   user = TwitterUser.find_by(username: params[:username])
#   # user.refresh_if_stale
#   recent_tweets = user.tweets.order(created_at: :desc).limit(10).collect do |t|
#     t.text
#   end
#   "<ul><li>" + recent_tweets.join("</li><li>") + "</li></ul>"
# end

post '/tweet_it' do
  tweet = CLIENT.update(params[:tweet])
  tweet.is_a?(Twitter::Tweet) ? "All good!" : "Error!"
end


