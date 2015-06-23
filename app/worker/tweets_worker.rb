class TweetsWorker
	include Sidekiq::Worker
	sidekiq_options queue: "high"

	def perform(tweet_id, user_id)
		tweet = Tweet.find(tweet_id)
		user = User.find(user_id)
	   	user.tweet(tweet.text)
	end

	# def perform(tweet_id)
	# 	tweet = Tweet.find(tweet_id)
	# 	configure_client
 #    	@client.update(tweet.text)
	# end

end