class Employee < ActiveRecord::Base

  validates :first_name,  :presence => true
  validates :last_name,   :presence => true


  has_many  :employments
  has_many  :roles, :through => :employments
end
