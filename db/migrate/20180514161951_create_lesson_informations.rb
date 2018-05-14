class CreateLessonInformations < ActiveRecord::Migration
  def change
    create_table :lesson_informations do |t|
      t.integer :faculty_id
      t.integer :department_id
      t.integer :year_id
      t.integer :term_id
      t.integer :teacher_id
      

      t.timestamps null: false
    end
  end
end
