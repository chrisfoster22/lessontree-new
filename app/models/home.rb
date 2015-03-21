class Home < ActiveRecord::Base
  has_many :lessons
  has_many :documents
  include PgSearch
  multisearchable :against => [:topic, :description, :content, :title]


  def self.search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end
  # searchable do
  #   text :topic, :boost => 5
  #   text :description, :created_at
  #   text :documents do
  #     documents.map(&:description)
  #   end
  #   time :created_at
  #   string :month_created
  # end

  def month_created
    created_at.strftime("%B %Y")
  end
end
