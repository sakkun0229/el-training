class AddDeadlineDateToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :deadline, :date
  end
end
