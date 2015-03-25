class HomeController < ApplicationController

  def index
    if params[:search]
      # @lessons = Lesson.all
      # filtered_lessons = []
      @lessons = Lesson.search(params[:search])
      # lessons = filtered_lessons.each {|l| lessons << l if l.subjects.include?(params[:subject_id])}
      # @lessons = lessons.map(&:title)
    else
      @lessons = Lesson.all.order(:updated_at).reverse.first(12)
    end
  end

end
