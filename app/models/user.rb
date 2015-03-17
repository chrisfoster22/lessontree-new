class User < ActiveRecord::Base
  has_many :plans
  has_many :lessons
  has_many :grade_levels
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def grade
    grade_id = self.grade_level_id
    grade = GradeLevel.find_by_id(grade_id)
    grade.title
  end
end
