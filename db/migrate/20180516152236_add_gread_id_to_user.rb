class AddGreadIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :gread_id, :integer
  end
end
