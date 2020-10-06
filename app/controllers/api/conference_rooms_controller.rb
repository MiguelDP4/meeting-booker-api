module Api
  class ConferenceRoomsController < ApplicationController
    def index
      rooms = ConferenceRoom.all
      render json: {status: 'SUCCESS', message: 'Loaded conference rooms', data: rooms}, status: :ok
    end

    def show
      room = ConferenceRoom.find(params[:id])
      render json: {status: 'SUCCESS', message: 'Loaded conference room', data: room}, status: :ok
    end

    def create
      new_room = ConferenceRoom.new(conference_room_params)
      
      if new_room.save
        render json: {status: 'SUCCESS', message: 'Saved conference room', data: new_room}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Room not saved', data: new_room.errors}, status: :unprocessable_entry
      end
    end

    def destroy
      room = ConferenceRoom.find(params[:id])
      room.destroy
      render json: {status: 'SUCCESS', message: 'Deleted Conference room', data: room}, status: :ok
    end

    def update
      room = ConferenceRoom.find(params[:id])
      if(room.update_attributes(conference_room_params))
        render json: {status: 'SUCCESS', message: 'Updated conference room', data: room}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Could not update conference room', data: room}, status: :unprocessable_entry
      end
    end

    private

    def conference_room_params
      params.permit(:size, :projector)
    end
  end
end