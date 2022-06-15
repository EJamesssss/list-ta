class Category < ApplicationRecord
    belongs_to :user
    has_many :tasks, dependent: :destroy

    validates :category_title, presence: true
    validates :category_details, presence: true
end
