class Employee < ActiveRecord::Base
  has_many  :employments
  has_many  :roles, :through => :employments
end
