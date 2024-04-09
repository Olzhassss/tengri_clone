class ArticleCategory < ApplicationRecord
    self.primary_key = 'slug'
    has_many :articles

    def self.ransackable_associations(auth_object = nil)
        ["articles"]
    end
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "slug", "title", "updated_at"]
    end
end
