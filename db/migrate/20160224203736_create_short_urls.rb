class CreateShortUrls < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.string :url, :null => false
      t.string :short, :null => false

      t.timestamps
    end

    add_index :short_urls, :short, :unique => true
  end
end
