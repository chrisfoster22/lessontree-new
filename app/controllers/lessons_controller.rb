class LessonsController < ApplicationController

  def new
  end

  def index
  end

  def create
  end

  def update
  end

  def destroy
  end

  def show
    @lessons = Lesson.all.order(:updated_at).reverse
    @search = Lesson.search do
      fulltext params[:search]
      with(:created_at).less_than(Time.zone.now)
      facet(:month_created)
      with(:month_created, params[:month]) if params[:month].present?
    end
    @lessons = @search.results
  end
end
