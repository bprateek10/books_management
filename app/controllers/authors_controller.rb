# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :set_author, except: [:index, :new, :create]

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to authors_path, notice: 'Author was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @author.update(author_params)
      redirect_to authors_path, notice: 'Author was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @author.destroy
    redirect_to authors_path, notice: 'Author was successfully destroyed.'
  end


  private

  def set_author
    @author = Author.find(params[:id])
    return false if @author.blank?
  end

  def author_params
    params.require(:author).permit(:first_name, :last_name, :date_of_birth)
  end
end
