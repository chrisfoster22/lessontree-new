class Home < ActiveRecord::Base
  attr_accessible :topic, :description, :content, :title
  has_many :lessons
  has_many :documents

  searchable do
    text :topic, :boost => 5
    text :description, :created_at
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
