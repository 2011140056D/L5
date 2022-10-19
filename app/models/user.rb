class User < ApplicationRecord
    has_many :tweets, dependent: :destroy#ユーザを消すといいねも消える
    
    validates :uid, presence: true, uniqueness: true
    validates :password, presence: true, confirmation: true
    
    attr_accessor :password, :password, :password_confirmation
    
    has_many :likes, dependent: :destroy#ユーザを消すといいねも消える
    has_many :like_tweets, through: :likes, source: :tweet
    
    def password=(val)
        if val.present?
           self.pass = BCrypt::Password.create(val)
        end
        @password=(val)
    end
end
