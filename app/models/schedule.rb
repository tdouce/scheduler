class Schedule < ActiveRecord::Base
  belongs_to :day

  validates :date, :presence => true,
            :uniqueness => true

end
