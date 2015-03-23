class Document < ActiveRecord::Base
  # include PgSearch
  # multisearchable :against => [:title, :content]
  belongs_to :lesson
  belongs_to :home
end
