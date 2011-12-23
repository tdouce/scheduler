class Shift < ActiveRecord::Base

  attr_accessible :name, :time_start, :time_end

  validates :name, :presence => true,
            :uniqueness => true
  validates :time_start, :presence => true
  validates :time_end, :presence => true

end
