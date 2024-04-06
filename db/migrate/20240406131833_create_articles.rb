class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :views
      t.string :thumb_caption
      t.datetime :published_at

      t.timestamps
    end
  end
end
