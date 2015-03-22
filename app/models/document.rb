class Document < ActiveRecord::Base
  # include PgSearch
  # multisearchable :against => [:title, :content]
  belongs_to :lessons
  belongs_to :home
end
