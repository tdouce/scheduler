class Role < ActiveRecord::Base

  attr_accessible :name
  
  validates :name, :presence => true 

  #has_many  :employments
  #has_many  :employees, :through => :employments
end
