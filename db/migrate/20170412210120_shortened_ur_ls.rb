class ShortenedUrLs < ActiveRecord::Migration[5.0]
  def change
    create_table :shortened_urls do |t|
      t.string :short_url
      t.string :long_url
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
