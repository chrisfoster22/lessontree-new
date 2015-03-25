module LessonsHelper
  def formatted_lesson_grade_levels(lesson)
    lesson.grade_levels.map(&:title).to_sentence
  end

  def formatted_lesson_subjects(lesson)
    lesson.subjects.map(&:title).to_sentence
  end

  def star_count(lesson)
    lesson.stars.count
  end
end
