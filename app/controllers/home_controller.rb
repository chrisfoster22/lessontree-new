class HomeController < ApplicationController

  def index
    if params[:search]
      @lessons = Lesson.search(params[:search]).order(:updated_at).reverse.first(12)
    else
      @lessons = Lesson.all.order(:updated_at).reverse.first(12)
    end
  end

end
