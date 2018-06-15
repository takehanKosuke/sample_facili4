class AddColumnToUser < ActiveRecord::Migration
  def change
    remove_column :users, :faculty_id, :integer
  end
end
