module Api
  class BookingsController < ApplicationController
    def index
      bookings = Booking.search_booking(booking_params)
      render json: {status: 'SUCCESS', message: 'Loaded bookings', data: bookings}, status: :ok
    end

    def show
      booking = Booking.find(params[:id])
      render json: {status: 'SUCCESS', message: 'Loaded booking', data: booking}, status: :ok
    end

    def create
      new_booking = Booking.new(booking_params)
      
      if new_booking.save
        render json: {status: 'SUCCESS', message: 'Saved booking', data: new_booking}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Todo not saved', data: new_booking.errors}, status: :unprocessable_entry
      end
    end

    def destroy
      booking = Booking.find(params[:id])
      booking.destroy
      render json: {status: 'SUCCESS', message: 'Deleted booking', data: booking}, status: :ok
    end

    def update
      booking = Booking.find(params[:id])
      if(booking.update_attributes(booking_params))
        render json: {status: 'SUCCESS', message: 'Updated booking', data: booking}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Could not update booking', data: booking}, status: :unprocessable_entry
      end
    end

    private

    def booking_params
      params.permit(:conference_room_id, :user_id, :start, :finish, :low_limit, :high_limit)
    end
  end
end