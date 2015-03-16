class CreateLessonsSubjectsJoinTable < ActiveRecord::Migration
  def change
    create_table :lessons_subjects, id: false do |t|
      t.integer :lesson_id
      t.integer :subject_id
    end
  end
end
