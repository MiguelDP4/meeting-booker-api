class StaticsController < ApplicationController
  def home
    render json: { info: 'This is the api home page' }
  end
end