class Home < ActiveRecord::Base
  has_many :lessons
  has_many :documents
<<<<<<< HEAD
=======
  # include PgSearch
  multisearchable :against => [:topic, :description, :content, :title]
>>>>>>> f5eb947f354898324361ce8f9322e37bf6c43165

  # searchable do
  #   text :topic, :boost => 5
  #   text :description, :created_at
  #   text :documents do
  #     documents.map(&:description)
  #   end
  #   time :created_at
  #   string :month_created
  # end
end
