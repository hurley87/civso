class RenamePostsToOrgs < ActiveRecord::Migration
  def change
      rename_table :posts, :orgs
  end
end
