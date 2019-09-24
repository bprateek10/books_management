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
    if @Author.save
      redirect_to admin_authors_path, notice: 'Author was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @author.update(author_params)
      redirect_to admin_faqs_path, notice: 'Author was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @author.destroy
    redirect_to admin_faqs_path, notice: 'Author was successfully destroyed.'
  end


  private

  def set_faq
    @author = Author.find(params[:id])
    return false if @author.blank?
  end

  def faq_params
    params.require(:author).permit(:first_name, :last_name, :date_of_birth)
  end
end
