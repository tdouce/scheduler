class Day < ActiveRecord::Base
  attr_accessible :name, :assignment_ids

  has_many  :assignments
  has_many  :shifts, :through => :assignments

end
