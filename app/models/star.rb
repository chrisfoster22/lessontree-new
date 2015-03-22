class Star < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :plan
end
