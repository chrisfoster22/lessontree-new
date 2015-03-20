class Home < ActiveRecord::Base
  attr_accessible :topic, :description, :content, :title
  include PgSearch
  multisearchable :against => [:topic, :description, :content, :title]
  has_many :lessons
  has_many :documents

  def self.search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end
end
