class ChangeFollowingToFollowingId < ActiveRecord::Migration
  def change
      rename_column :users, :following, :following_org_id
  end
end
