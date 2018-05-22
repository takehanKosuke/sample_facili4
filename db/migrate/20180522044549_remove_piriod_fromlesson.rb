class RemovePiriodFromlesson < ActiveRecord::Migration
  def change
    remove_column :lessons, :piriod, :integer
  end
end
