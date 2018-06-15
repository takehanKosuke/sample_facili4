class ChangeDatatypeReferencebookOfLesson < ActiveRecord::Migration
  def change
    change_column :lessons, :referencebook, :text
    change_column :lessons, :textbook, :text
  end
end
