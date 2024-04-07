class Article < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "published_at", "title", "tldr"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
