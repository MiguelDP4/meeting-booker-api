class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :conference_room

  def self.search_booking(params)
    room_id = params[:conference_room_id]
    user_id = params[:user_id]
    from_date = params[:low_limit]
    to_date = params[:high_limit]
    
    from_date = 30.days.ago if from_date.nil?
    to_date = Date.today + 30.days if to_date.nil?

    if room_id && user_id
      bookings = Booking.where(
        "user_id = ? AND conference_room_id = ?
        AND start >= ? AND start <= ?",
        user_id, room_id, from_date, to_date)
    elsif room_id.nil? && user_id
      bookings = Booking.where(
        "user_id = ?
        AND start >= ? AND start <= ?",
        user_id, from_date, to_date)
    elsif room_id && user_id.nil?
      bookings = Booking.where(
        "conference_room_id = ?
        AND start >= ? AND start <= ?",
        room_id, from_date, to_date)
    elsif room_id.nil? && user_id.nil?
      bookings = Booking.where(
        "start >= ? AND start <= ?",
        from_date, to_date)
    end
  end
end
