class HomeController < ApplicationController

  def index
    @lessons = Lesson.query(params).order(:updated_at).reverse.first(6)
  end
end
      # filtered_lessons = []
      # lessons = Lesson.search(params[:search])
      # lessons = filtered_lessons.each {|l| lessons << l if l.subjects.include?(params[:subject_id])}
      # @lessons = lessons.map(&:title)
