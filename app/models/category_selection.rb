class CategorySelection < ApplicationRecord
    validates :category, presence: true, length: { maximum: 50 }, uniqueness: true
end
