class Role < ActiveRecord::Base
  has_many  :employments
  has_many  :employees, :through => :employments
end
