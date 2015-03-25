class User < ActiveRecord::Base
  has_many :lessons
  has_many :grade_levels, through: :lessons
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://blog.cremationsolutions.com/wp-content/uploads/2014/04/Missed-Person.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def to_s
    name
  end
end
