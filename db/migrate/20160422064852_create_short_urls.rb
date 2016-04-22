class CreateShortUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :short_urls do |t|
      t.integer :is_visible, default: 1
      t.string :original_url
      t.string :shorten_url
      t.string :reserved_url
      t.string :index
      t.integer :click_count, default: 0

      t.timestamps
    end
  end
end
