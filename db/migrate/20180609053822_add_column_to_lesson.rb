class AddColumnToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :code, :integer
    add_column :lessons, :target, :text
    add_column :lessons, :contents, :text
    add_column :lessons, :level, :text
    add_column :lessons, :evaluation, :text
    add_column :lessons, :plan, :text

    remove_column :lessons, :faculty_id, :integer
    remove_column :lessons, :room_number, :string
    remove_column :lessons, :lesson_information_id, :integer
  end
end
