module UsersHelper
  def formatted_user_grade_levels(user)
    user.grade_levels.map(&:title).to_sentence
  end
end
