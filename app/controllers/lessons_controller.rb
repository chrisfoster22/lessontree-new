class LessonsController < ApplicationController
<<<<<<< HEAD
  def index
    @lessons = Lesson.order("created_at DESC")
  end

  def show
    @lesson = Lesson.find(params[:id])
=======

  def new
>>>>>>> 8e37a3923e4b1930fdaa955984a4e0e7f602c6ba
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
    params.require(:lesson).permit(:topic, :description)
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
