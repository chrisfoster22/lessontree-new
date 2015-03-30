class GradeLevel < ActiveRecord::Base
  has_many :lessons
end
