class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable,
         :recoverable, :rememberable, :omniauthable, omniauth_providers: [:google_oauth2]

  enum role: { author: 0, moderator: 1, administrator: 2, viewer: 3 }, _prefix: 'role'
  
  has_many :discussions

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    #Uncomment the section below if you want users to be created if they don't exist
      unless user
          user = User.create(
            :email => data['email']
          )
      end
    user
  end

end
