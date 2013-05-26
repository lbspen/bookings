class Client < ActiveRecord::Base
  attr_accessible :name
  has_many :bookings
  has_many :engineers, :through => :bookings
  validates :name, :presence => true
end
