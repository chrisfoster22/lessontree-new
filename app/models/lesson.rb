class Lesson < ActiveRecord::Base
  has_many :stars
  belongs_to :plan
  belongs_to :subject
  belongs_to :user
  has_many :lesson_grade_levels
  has_many :grade_levels, through: :lesson_grade_levels
  has_many :lesson_subjects
  has_many :subjects, through: :lesson_subjects
  has_many :documents

  def self.search(search)
    if search
      # find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
      where('topic ILIKE ? OR description ILIKE ?' , "%#{search}%", "%#{search}%")
    else
      # find(:all)
      Lesson.all
    end
  end

  def username
    id = self.user_id
    user = User.find_by(id: id)
    user.name || ""
  end

end
