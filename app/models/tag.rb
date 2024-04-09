class Tag < ApplicationRecord
    has_and_belongs_to_many :articles

    def self.ransackable_attributes(auth_object = nil)
        ["name"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["articles"]
    end
end
