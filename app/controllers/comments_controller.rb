class CommentsController < ApplicationController
  before_action :find_book

  def index
    @comments = @book.comments.all.order('created_at DESC')
    render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)
    authorize @comment
    if @comment.save
      render json: @comment
    else
      render json: { message: (I18n.t 'book.comment_failure') }, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = @book.comments.find(destroy_params[:id])
    authorize @comment
    @comment.destroy
    if @comment.nil?
      render json: { message: (I18n.t 'book.delete_comment_failure') }, status: :bad_request
    else
      render json: { message: (I18n.t 'book.delete_comment_success') }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :book_id)
  end

  def destroy_params
    params.permit(:id, :book_id)
  end

  def find_book
    @book = Book.find(params[:book_id])
  end
end
