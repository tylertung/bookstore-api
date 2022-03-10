class BooksController < ApplicationController
  before_action :set_book, only: %i[show update destroy]
  # GET /books
  def index
    @books = Book.where(nil)
    search_params.each do |key, value|
      @books = Book.public_send("filter_by_#{key}", value) if value.present?
    end

    render json: @books
  end

  # GET /books/1
  def show
    render json: { book: BookSerializer.new(@book) }
  end

  # POST /books
  def create
    @book = Book.new(book_params.except(:genres))
    @genre = Genre.find_by(name: book_params[:genres])
    @book.genres << @genre if @genre
    authorize @book
    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: { message: @book.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: { message: @book.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  def genres
    @genres = Genre.all
    render json: @genres
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:title, :description, :author_id, :genres)
  end

  def search_params
    params.permit(:start_with, :genre)
  end
end
