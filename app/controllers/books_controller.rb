class BooksController < ApplicationController
  # before_action :set_todo
  skip_before_action :verify_authenticity_token

  before_action :set_book, only: [:destroy]

  # GET /books
  def index
    render json: Book.all
  end

  # POST /books
  def create
    @book = Book.create!(book_params)
    render json: @book
  end

  # DELETE /books:id
  def destroy
    @book.destroy
    head :no_content
  end

  private

  def book_params
    params.require(:book).permit(:title, :category, :author)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
end
