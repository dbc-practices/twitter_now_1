class TwitterUser < ActiveRecord::Base
  has_many :tweets
  after_create :populate_recent_tweets

  def populate_recent_tweets
    CLIENT.search("from:#{self.username}").to_a.reverse.each do |tweet|
      self.tweets.where(text: tweet.text).first_or_create
    end
  end

  def refresh_if_stale
    if is_stale?
      populate_recent_tweets
    end
  end

  def is_stale?
    ((Time.now - self.tweets.last.created_at) / 60.0) > 1
  end

end
