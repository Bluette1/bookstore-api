class BooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_book, only: %i[destroy update]

  before_action :authenticate_user!

  # GET /books
  def index
    render json: Book.all
  end

  # POST /books
  def create
    @book = Book.create!(book_params)
    render json: @book
  end

  # PUT /books/:id
  def update
    @book.update(book_params)
    render json: @book
  end

  # DELETE /books:id
  def destroy
    @book.destroy
    head :no_content
  end

  private

  def book_params
    params.require(:book).permit(
      :title, :category, :author, :pagesRead, :totalPages, :currentChapter
    )
  end

  def set_book
    @book = Book.find(params[:id].to_i)
  end
end
