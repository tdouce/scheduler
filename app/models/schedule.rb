class Schedule < ActiveRecord::Base

  attr_accessible :schedule_id

  belongs_to :day
  has_many   :workdays

  validates :date, :presence => true,
            :uniqueness => true

end
