class Category < ApplicationRecord
    belongs_to :user
    has_many :tasks, dependent: :destroy

    validates :category_title, presence: true, uniqueness: { scope: :user_id, case_sensitive: false, message: "already exist"}
    validates :category_details, presence: true
end
