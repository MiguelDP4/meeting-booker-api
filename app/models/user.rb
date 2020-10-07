class User < ApplicationRecord
  has_secure_password
  has_many :bookings

  validates_presence_of :name
  validates_uniqueness_of :name

  def find_bookings
    bookings.all
  end
end
