module UsersHelper
  def formatted_grade_level_name(user)
    GradeLevel.find_by_id(user.grade_level_id).title if user.grade_level_id
  end

  def all_grades
    GradeLevel.all
  end
end
