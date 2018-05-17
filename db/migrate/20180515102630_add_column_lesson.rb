class AddColumnLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :department_id ,:integer
    add_column :lessons, :faculty_id, :integer
    add_column :lessons, :gread_id, :integer
    add_column :lessons, :teacher_id, :integer
    add_column :lessons, :term_id, :integer
    add_column :lessons, :year_id, :integer
  end
end
