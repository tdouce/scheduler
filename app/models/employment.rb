class Employment < ActiveRecord::Base
  belongs_to :employee
  belongs_to :role
end
