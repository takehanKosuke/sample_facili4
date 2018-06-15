class AddClassificationIdToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :classification_id, :integer

    remove_column :lessons, :lesson_information_id, :integer

  end
end
