class CreateArticleCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :article_categories, id: :string, primary_key: :slug do |t|
      t.string :title

      t.timestamps
    end
  end
end
