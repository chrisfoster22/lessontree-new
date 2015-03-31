class Home < ActiveRecord::Base
  has_many :lessons
  has_many :documents
end
