class HomeController < ApplicationController
  def index
    @lessons = Lesson.all.order(:updated_at).reverse
  end
end
