class AddGradeLevelToUsers < ActiveRecord::Migration
  def change
    add_column :users, :grade_level_id, :integer
  end
end
