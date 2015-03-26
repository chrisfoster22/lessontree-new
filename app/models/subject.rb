class Subject < ActiveRecord::Base
  has_many :lessons, through: :lesson_subjects
  has_many :lesson_subjects 
end
