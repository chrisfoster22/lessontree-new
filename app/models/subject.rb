class Subject < ActiveRecord::Base
  # include PgSearch
  has_many :lessons
end
