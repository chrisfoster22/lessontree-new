class RemovePlanIdFromStars < ActiveRecord::Migration
  def change
    remove_column :stars, :plan_id, :integer
  end
end
