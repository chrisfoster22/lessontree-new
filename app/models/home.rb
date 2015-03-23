class Home < ActiveRecord::Base
  has_many :lessons
  has_many :documents



  # def self.search(search)
  #   search_condition = "%" + search + "%"
  #   find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
  # end

end
