class AddCompletedToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :completed_status, :boolean
  end
end
