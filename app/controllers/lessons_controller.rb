class LessonsController < ApplicationController
  def index
    @lessons = Lesson.order("created_at DESC")
  end

  def show
    @lesson = Lesson.find_by_id(params[:id])
    @lessons = Lesson.all.order(:updated_at).reverse
    @search = Lesson.search do
      fulltext params[:search]
      with(:created_at).less_than(Time.zone.now)
      facet(:month_created)
      with(:month_created, params[:month]) if params[:month].present?
    end
    @lessons = @search.results
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to @lesson, notice: "The lesson has been successfully created."
    else
      render action: "new"
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update_attributes(lesson_params)
      redirect_to lessons_path, notice: "The lesson has been successfully updated."
    else
      render action: "edit"
    end
  end

private

  def lesson_params
    params.require(:lesson).permit(:topic, :description, :id)
  end

end
