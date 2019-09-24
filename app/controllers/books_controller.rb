# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :set_book, except: [:index, :new, :create]

  def index
    @authors = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(author_params)
    if @book.save
      redirect_to books_path, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to books_path, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully destroyed.'
  end


  private

  def set_author
    @book = Book.find(params[:id])
    return false if @book.blank?
  end

  def author_params
    params.require(:book).permit(:title, :author_ids)
  end
end
