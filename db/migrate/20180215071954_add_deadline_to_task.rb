class AddDeadlineToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :deadline, :timestamp
  end
end
