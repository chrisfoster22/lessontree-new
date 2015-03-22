class HomeController < ApplicationController

    # lesson_list = Lesson.all.order(:updated_at).reverse
    # if params[:search]
    #   @search = Lesson.search do
    #     fulltext params[:search] do
    #       fields(:description, :topic)
    #     end
    #   end
    # end
    # if @search
    #   @lessons = @search.results
    # else
    #   @lessons = lesson_list[0...12]
    # end

  def index
    @lessons = Lesson.all.order(:updated_at).reverse.first(9)
    # @pg_search_documents = PgSearch.multisearch(params[:query])
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
