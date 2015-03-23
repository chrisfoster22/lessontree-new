class LessonsController < ApplicationController
  def index
    @lessons = Lesson.order("created_at DESC")
  end

  def show
    @lesson = Lesson.find_by_id(params[:id])
    @star = Star.new
    @documents = @lesson.documents
    @plan = @lesson.plan
    if @plan
      @default = @plan.id
    end
    if Star.find_by(lesson_id: @lesson.id, user_id: current_user.id)
      @starred = true
    else
      @starred = false
    end
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.create(lesson_params)
    if @lesson.save
      @lesson.user_id = current_user.id
      @lesson.save!
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
      redirect_to @lesson, notice: "The lesson has been successfully updated."
    else
      render action: "edit"
    end
  end

private

  def lesson_params
    params.require(:lesson).permit(:upload, :topic, :description, :id, :user_id, :plan_id)
  end

end
