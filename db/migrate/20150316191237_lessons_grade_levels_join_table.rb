class LessonsGradeLevelsJoinTable < ActiveRecord::Migration
  def change
    create_table :lessons_grade_levels, id: false do |t|
      t.integer :lesson_id
      t.integer :grade_level_id
    end
  end
end
