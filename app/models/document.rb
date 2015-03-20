class Document < ActiveRecord::Base
  attr_accessible :title, :content
  include PgSearch
  multisearchable :against => [:title, :content]
  belongs_to :lessons
  belongs_to :home
end
