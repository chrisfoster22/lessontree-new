class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :star_count

      t.timestamps null: false
    end
  end
end
