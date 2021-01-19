class ReadingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @readings = current_user.readings.includes(:book)
    render json: @readings
  end

  def create
    @reading = current_user.readings.build(book_id: params[:id])

    render json: @reading if @reading.save
    head :unauthorized
  end

  def update
    reading = Reading.find_by(id: params[:id], user: current_user)
    if reading
      reading.update(params[:reading])
      render json: reading
    else
      head :not_found
    end
  end

  def destroy
    reading = Reading.find_by(id: params[:id], user: current_user)
    if reading
      reading.destroy
      head :no_content
    else
      head :not_found
    end
  end
end
