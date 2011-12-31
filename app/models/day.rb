class Day < ActiveRecord::Base
  attr_accessible :name, :assignment_ids, :shift_ids

  has_many  :assignments
  has_many  :shifts, :through => :assignments
  has_many  :schedules

end
