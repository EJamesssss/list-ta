class Task < ApplicationRecord
  belongs_to :category

  validates :task_name, presence: true, uniqueness: {scope: :category_id, case_sensitive: false, message: "already exist"}
  validates :task_details, presence: true
  validates :date, presence: true
  validates :category_id, presence: true
end
