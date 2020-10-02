module Api
  class SessionsController < ApplicationController
    def create
      user = User
              .find_by(name: params["user"]["name"])
              .try(:authenticate, params["user"]["password"])

      if user
        session[:user_id] = user.id
        render json: {
          status: :created,
          logged_in: true,
          user: user
        }
      else
        render json: { status: 'ERROR', message: 'Could not start session. Incorrect user or password' }, status: :unprocessable_entry
      end
    end
  end
end