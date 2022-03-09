class RatesController < ApplicationController
  before_action :find_book
  before_action :find_rate, only: [:destroy]

  def create
    if already_rated?
      render json: { message: (I18n.t 'book.already_rated_book') }
    else
      @book.rates.create(user_id: rate_params[:user_id])
      render json: { book: @book, message: (I18n.t 'book.rated_book') }
    end
  end

  def destroy
    if already_rated?
      @rate.destroy
      render json: { message: (I18n.t 'book.unrated_book') }
    else
      render json: { message: (I18n.t 'book.unrated_book_failure') }
    end
  end

  private

  def find_book
    @book = Book.find(rate_params[:book_id])
  end

  def find_rate
    @rate = @book.rates.find(rate_params[:id])
  end

  def already_rated?
    Rate.where(user_id: rate_params[:user_id], book_id: rate_params[:book_id]).exists?
  end

  def rate_params
    params.permit(:user_id, :book_id, :id)
  end
end
