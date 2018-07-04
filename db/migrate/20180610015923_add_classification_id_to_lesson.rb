class AddClassificationIdToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :classification_id, :integer
  end
end
