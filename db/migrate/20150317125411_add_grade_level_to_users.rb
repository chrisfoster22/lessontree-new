class AddGradeLevelToUsers < ActiveRecord::Migration
  def change
    add_column :users, :grade_level, :string
  end
end
