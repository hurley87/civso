class RenameColumnContentToDescription < ActiveRecord::Migration
  def change
    rename_column :orgs, :content, :description
  end
end
