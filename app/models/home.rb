class Home < ActiveRecord::Base
  attr_accessible :topic, :description, :content, :title
  include PgSearch
  multisearchable :against => [:topic, :description, :content, :title]
  has_many :lessons
  has_many :documents

<<<<<<< HEAD
  def self.search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end
=======
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

>>>>>>> 6515d6b3b69e93fb93fd5eb5f7dc97d6b9657fba
end
