class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :mailchimp

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :country
  attr_accessible :password, :password_confirmation, :remember_me, :join_mailing_list

  def to_s
  	name ? name : email
  end
end
