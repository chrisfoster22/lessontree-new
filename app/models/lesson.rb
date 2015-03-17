class Lesson < ActiveRecord::Base
  belongs_to :plan
  belongs_to :subject
  belongs_to :user
  belongs_to :grade_level
  has_many :documents

end
