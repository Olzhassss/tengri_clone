class Article < ApplicationRecord
  has_one :article_category, primary_key: :slug, foreign_key: :article_category_id

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "published_at", "title", "tldr"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["article_category"]
  end
end
