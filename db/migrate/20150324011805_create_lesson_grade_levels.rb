class CreateLessonGradeLevels < ActiveRecord::Migration
  def change
    create_table :lesson_grade_levels do |t|
      t.integer :lesson_id, { null: false, index: true }
      t.integer :grade_level_id, { null: false, index: true }
    end
  end
end
