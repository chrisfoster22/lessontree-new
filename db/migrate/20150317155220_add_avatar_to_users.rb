class AddAvatarToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :profile_photo, :string
    add_attachment :users, :avatar
  end
end
