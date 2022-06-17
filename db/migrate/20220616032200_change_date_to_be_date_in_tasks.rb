class ChangeDateToBeDateInTasks < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :date, :date, using: 'date::date'
  end
end
