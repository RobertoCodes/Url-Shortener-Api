class AddColumnToShortUrls < ActiveRecord::Migration
  def change
    add_column :short_urls, :visit_count, :integer, default: 0
  end
end
