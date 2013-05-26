class Engineer < ActiveRecord::Base
  attr_accessible :name
  has_many :bookings
  has_many :clients, :through => :bookings
  validates :name, :presence => true
end
