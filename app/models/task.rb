class Task < ApplicationRecord
  belongs_to :category

  validates :task_name, presence: true
  validates :task_details, presence: true
  validates :date, presence: true
  validates :category_id, presence: true
end
