class Home < ActiveRecord::Base
  attr_accessible :topic, :description, :content, :title
  has_many :lessons
  has_many :documents

  # searchable do
  #   text :topic, :boost => 5
  #   text :description, :created_at
  # end
  #
  # def month_created
  #   created_at.strftime("%B %Y")
  # end
end
