class Category < ApplicationRecord
    belongs_to :user

    validates :category_title, presence: true
    validates :category_details, presence: true
end
