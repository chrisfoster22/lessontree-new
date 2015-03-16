class CreateGradeLevels < ActiveRecord::Migration
  def change
    create_table :grade_levels do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
