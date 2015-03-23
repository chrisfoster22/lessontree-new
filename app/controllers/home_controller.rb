class HomeController < ApplicationController


  def index
    if params[:search]
      @lessons = Lesson.search(params[:search]).order(:updated_at).reverse.first(9)
    else
      @lessons = Lesson.all.order(:updated_at).reverse.first(9)
    end
  end

  # def search
  #   @lessons = Lesson.search(params[:search])
  # end

  def show
  end

  def update
  end

  def destroy
  end

  def about
  end
end
