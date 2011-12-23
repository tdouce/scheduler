class Assignment < ActiveRecord::Base
  attr_accessible :shift_id, :day_id

  belongs_to  :day
  belongs_to  :shift
end
