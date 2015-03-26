class User < ActiveRecord::Base
  # before_action :authenticate_user!
  # user_signed_in?
  # current_user
  acts_as_commontator
  has_many :lessons
  has_many :grade_levels, through: :lessons
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://blog.cremationsolutions.com/wp-content/uploads/2014/04/Missed-Person.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def to_s
    name
  end

  def self.find_version_author(version)
    find(version.terminator)
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name:auth.extra.raw_info.name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email,
                            password:Devise.friendly_token[0,20],
                          )
      end
    end
  end
end
