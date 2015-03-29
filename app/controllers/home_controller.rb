class HomeController < ApplicationController

  def index
    @lessons = Lesson.query(params).page(params[:page]).per(5)
    # @lessons = Lesson.paginate(page: params[:page],:per_page => 5).query(params)
    @grades = GradeLevel.all
    @subjects = Subject.all
  end
end
      # filtered_lessons = []
      # lessons = Lesson.search(params[:search])
      # lessons = filtered_lessons.each {|l| lessons << l if l.subjects.include?(params[:subject_id])}
      # @lessons = lessons.map(&:title)
