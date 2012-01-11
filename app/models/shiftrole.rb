class Shiftrole < ActiveRecord::Base
  
  attr_accessible :shift_id, :role_id

  # The belongs_to in has_many through points to the model name, NOT the table name
  belongs_to :shift
  belongs_to :role
end
