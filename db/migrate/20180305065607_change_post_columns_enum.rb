class ChangePostColumnsEnum < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :priority, :integer
    change_column :posts, :status, :integer
  end
end
