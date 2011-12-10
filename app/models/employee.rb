class Employee < ActiveRecord::Base

  # Have to make these attributes accessible to insert into join table (employments)
  attr_accessible :first_name, :last_name, :role_ids

  validates :first_name,  :presence => true
  validates :last_name,   :presence => true

  has_many  :employments
  has_many  :roles, :through => :employments

  # Creates web-friendly name
  def full_name
    #self.first_name + ' ' + self.last_name
    [ self.first_name, self.last_name ].join(" ")
  end

end
