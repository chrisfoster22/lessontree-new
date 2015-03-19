class HomeController < ApplicationController
  def index
    lesson_list = Lesson.all.order(:updated_at).reverse
    if params[:search]
      @search = Lesson.search do
        fulltext params[:search] do
          fields(:description, :topic)
        end
      end
    end
    if @search
      @lessons = @search.results
    else
      @lessons = lesson_list[0...12]
    end
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
