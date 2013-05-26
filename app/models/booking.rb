class Booking < ActiveRecord::Base
  attr_accessible :cost, :engineer, :client
  belongs_to :engineer
  belongs_to :client
end
