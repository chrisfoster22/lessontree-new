class HomeController < ApplicationController


  def index
    @lessons = Lesson.all.order(:updated_at).reverse
    @lessons = Lesson.all.order(:updated_at).reverse.first(9)
  end

  def show
  end

  def update
  end

  def destroy
  end

  def about
  end
end
