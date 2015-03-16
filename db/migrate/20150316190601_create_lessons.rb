class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :topic
      t.text :description
      t.integer :user_id
      t.integer :plan_id
      t.integer :star_count

      t.timestamps null: false
    end
  end
end
