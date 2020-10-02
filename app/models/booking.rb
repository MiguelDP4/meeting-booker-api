class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :conference_room
end
