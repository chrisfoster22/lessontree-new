class AddLocationProfilePicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :school, :string
    add_column :users, :profile_photo, :string
  end
end
