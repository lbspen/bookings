class Booking < ActiveRecord::Base
  attr_accessible :cost, :engineer, :client
  belongs_to :engineer
  belongs_to :client
  validates :cost, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
end
