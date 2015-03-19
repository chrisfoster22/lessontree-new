class Lesson < ActiveRecord::Base
  attr_accessible :topic, :description
  belongs_to :plan
  belongs_to :subject
  belongs_to :user
  belongs_to :grade_level
  belongs_to :home
  has_many :documents

  # searchable do
  #   text :topic, :boost => 5
  #   text :description, :created_at
  # end

  searchable do
    text :topic, :boost => 5
    text :description, :month_created
    text :documents do
      documents.map(&:description)
    end
    time :created_at
    string :month_created
  end

  def month_created
    created_at.strftime("%B %Y")
  end
end
