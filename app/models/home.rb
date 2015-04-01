class Home < ActiveRecord::Base
  has_many :lessons
  has_many :documents

  def starred?(user, lesson)
    user && Star.find_by(lesson_id: @lesson.id, user_id: user.id)
  end
end
