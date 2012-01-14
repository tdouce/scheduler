class Role < ActiveRecord::Base

  attr_accessible :name, :employee_ids, :shift_ids
                     
  has_many  :employments
  has_many  :employees, :through => :employments

  has_many  :shiftroles
  has_many  :shifts, :through => :shiftroles
 
  validates :name, :presence => true,
            :uniqueness => true

end
