class AddPriorityToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :priority, :integer
  end
end
