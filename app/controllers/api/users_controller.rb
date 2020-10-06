module Api
  class UsersController < ApplicationController
    def index
      users = User.all
      render json: {status: 'SUCCESS', message: 'Loaded users', data: users}, status: :ok
    end

    def show
      user = User.find_by(:name => params[:name])
      render json: {status: 'SUCCESS', message: 'Loaded user', data: user}, status: :ok
    end

    def create
      user = User.new(user_params)
      
      if user.save
        render json: {status: 'SUCCESS', message: 'Saved user', data: user}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Todo not saved', data: user.errors}, status: :unprocessable_entry
      end
    end

    def destroy
      user = User.find_by(:name => params[:name])
      user.destroy
      render json: {status: 'SUCCESS', message: 'Deleted user', data: user}, status: :ok
    end

    def update
      user = User.find(params[:id])
      if(user.update_attributes(user_params))
        render json: {status: 'SUCCESS', message: 'Updated user', data: user}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Could not update user', data: user}, status: :unprocessable_entry
      end
    end

    private

    def user_params
      params.permit(:name, :password)
    end
  end
end