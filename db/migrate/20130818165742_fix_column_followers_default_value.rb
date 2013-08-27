class FixColumnFollowersDefaultValue < ActiveRecord::Migration
  def change
    change_column :orgs, :followers, :integer, :default => 0
  end
end
