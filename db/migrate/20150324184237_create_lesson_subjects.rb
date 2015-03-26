class CreateLessonSubjects < ActiveRecord::Migration
  def change
    create_table :lesson_subjects do |t|
      t.integer :lesson_id, { null: false, index: true }
      t.integer :subject_id, { null: false, index: true }
    end
  end
end
