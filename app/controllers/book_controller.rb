class BookController < ApplicationController
  # before_action :set_todo
  before_action :set_book, only: [:destroy]

  # GET /books
  def index
    render json: User.all
  end

  # POST /book
  def create
    @book = Todo.create!(book_params)
    render json: @book
  end

  # DELETE /book:id
  def destroy
    @book.destroy
    head :no_content
  end

  private

  def book_params
    params.permit(:title, :category, :author)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
end
