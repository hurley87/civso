class AddFollowingToUsers < ActiveRecord::Migration
  def change
      add_column :users, :following, :integer, :default => 0
  end
end
