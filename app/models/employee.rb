class Employee < ActiveRecord::Base

  attr_accessible :first_name, :last_name

  validates :first_name,  :presence => true
  validates :last_name,   :presence => true

  has_many  :employments
  has_many  :roles, :through => :employments

  # Creates web-friendly name
  def full_name
    self.first_name + ' ' + self.last_name
  end

end
