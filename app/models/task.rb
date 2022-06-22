class Task < ApplicationRecord
  belongs_to :category

  validates :task_name, presence: true, uniqueness: { case_sensitive: false, scope: :category_id}
  validates :task_details, presence: true
  validates :date, presence: true
  validates :category_id, presence: true
end
