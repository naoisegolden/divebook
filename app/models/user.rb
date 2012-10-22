class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable,
         :mailchimp,  :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :country
  attr_accessible :password, :password_confirmation, :remember_me, :join_mailing_list # for devise
  attr_accessible :provider, :uid # for oauth

  def to_s
  	name ? name : email
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.where(:email => auth.info.email).first
    end
    unless user
      user = User.create( name: auth.extra.raw_info.name,
                          provider: auth.provider,
                          uid: auth.uid,
                          email: auth.info.email,
                          password: Devise.friendly_token[0,20]
                        )
    end
    user
  end

end