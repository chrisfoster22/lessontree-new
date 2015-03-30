class HomeController < ApplicationController

  def index
    @lessons = Lesson.query(params).order('updated_at DESC').page(params[:page]).per(5)
    @grades = GradeLevel.all
    @subjects = Subject.all
  end
end
