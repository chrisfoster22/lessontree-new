class Plan < ActiveRecord::Base
  has_many :lessons
  belongs_to :user
  accepts_nested_attributes_for :lessons
end
