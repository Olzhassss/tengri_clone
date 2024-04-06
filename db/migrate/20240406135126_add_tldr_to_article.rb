class AddTldrToArticle < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :tldr, :string
  end
end
