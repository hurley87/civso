class ChangePostIdInTags < ActiveRecord::Migration
  def change
      rename_column :tags, :post_id, :org_id
  end
end
