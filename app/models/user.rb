class User < ActiveRecord::Base

  has_many :posts
  has_many :comments
  has_many :images, as: :imageable 
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :omniauthable
  devise :confirmable

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
    # user.email = auth.info.email
    # if auth.provider == "twitter" 
    #      user.save(:validate => false) 
    #    else
    #      user.save
    #    end oauth_token: auth['credentials'].token, oauth_expires_at: Time.at(auth['credentials'].expires_at)

    #user.r_basicprofile = auth.r_basicprofile
    #user.password = auth.info.passwordo
    #auth_token: oauth['credentials']['token'],
            #oauth_secret: oauth['credentials'].try(:[],'secret'),provider: oauth['provider'], 
            #uid: oauth['uid'], 

    user.provider = auth.provider
    user.uid = auth.uid
    user.name = auth.info.name
    user.oauth_token = auth.credentials.token
    #user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save!
  end
#   def self.from_omniauth(auth, current_user)
#     authorization = Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
#     if authorization.user.blank?
#       user = current_user || User.where('email = ?', auth["info"]["email"]).first
#       if user.blank?
#        user = User.new
#        user.password = Devise.friendly_token[0,10]
#        user.name = auth.info.name
#        user.email = auth.info.email
#        if auth.provider == "twitter" 
#          user.save(:validate => false) 
#        else
#          user.save
#        end
#      end
#      authorization.username = auth.info.nickname
#      authorization.user_id = user.id
#      authorization.save
#    end
#    authorization.user
#  end
# end
end
end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

