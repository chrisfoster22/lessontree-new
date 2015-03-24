class DropJoinTables < ActiveRecord::Migration
  def change
    drop_table :lessons_grade_levels
    drop_table :lessons_subjects
  end
end
