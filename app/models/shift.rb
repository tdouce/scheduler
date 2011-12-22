class Shift < ActiveRecord::Base
  validates :name, :presence => true,
            :uniqueness => true
  validates :time_start, :presence => true
  validates :time_end, :presence => true

end
