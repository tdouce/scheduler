class Shift < ActiveRecord::Base

  attr_accessible :name, :time_start, :time_end
  #attr_accessor :day_of_week_template_name

  has_many :days

  validates :name, :presence => true,
            :uniqueness => true
  validates :time_start, :presence => true
  validates :time_end, :presence => true

  #DAY_OF_WEEK = [ 'Monday', 'Slow_Monday' ]

  #def add_day_of_week( new_name )
  #  DAY_OF_WEEK << new_name
  #end

end
