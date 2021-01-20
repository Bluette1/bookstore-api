class ReadingsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
    @readings = current_user.readings.includes(:book)
    mapped_readings = map_to_res @readings
    render json: mapped_readings
  end

  def create
    @reading = current_user.readings.build(book_id: params[:book_id])

    if @reading.save
      render json: @reading
    else
      head :bad_request
    end
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

  private

  def map_to_res(readings)
    readings.map do |reading|
      {
        pagesRead: reading[:pagesRead],
        currentChapter: reading[:currentChapter],
        book: reading.book,
        id: reading[:id]
      }
    end
  end
end
