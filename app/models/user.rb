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
            :email => data['email'],
            :confirmation_token => SecureRandom.urlsafe_base64(15)
          )
      end
    user
  end

  def send_confirmation_email(user)
    ConfirmMailer.with(user: user).confirmation_email.deliver
    user.confirmation_sent_at = DateTime.now
    user.save!
  end

  def send_assignment_email(user)
    AssignMailer.with(user: user).assignment_email.deliver
  end

end
