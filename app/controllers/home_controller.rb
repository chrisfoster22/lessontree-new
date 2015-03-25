class HomeController < ApplicationController

  def index
    if params[:search]
      @lessons = Lesson.search(params[:subject_id], params[:grade_level_id], params[:search]).reverse.first(9)
    else
      @lessons = Lesson.all.order(:updated_at).reverse.first(9)
    end
  end
end
      # filtered_lessons = []
      # lessons = Lesson.search(params[:search])
      # lessons = filtered_lessons.each {|l| lessons << l if l.subjects.include?(params[:subject_id])}
      # @lessons = lessons.map(&:title)
