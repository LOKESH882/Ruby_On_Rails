class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @books = Book.all
        render json: @books
    end

    def show
        @book = Book.find(params[:id])
        render json: @book
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            render json: @book, status: :created
        end
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            render json: @book
        else
            render json: @book.errors, status: :unprocessable_entity
        end
    end
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
    end

    private
    def book_params
        params.require(:book).permit(:title, :author, :published)
    end
end
