class User < ApplicationRecord
    has_many :tweets
    
    validates :uid, :pass, presence: true, uniqueness: true
    
    has_many :likes
    has_many :like_tweets, through: :likes, source: :tweet
end
