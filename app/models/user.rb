class User < ApplicationRecord
  has_secure_password
  has_many :bookings

  validates_presence_of :name
  validates_uniqueness_of :name
end
