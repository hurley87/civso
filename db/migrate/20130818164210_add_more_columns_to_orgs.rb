class AddMoreColumnsToOrgs < ActiveRecord::Migration
  def change
      add_column :orgs, :industry, :string
      add_column :orgs, :followers, :integer, :default => 0
  end
end
