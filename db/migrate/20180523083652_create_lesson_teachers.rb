class CreateLessonTeachers < ActiveRecord::Migration
  def change
    create_table :lesson_teachers do |t|
      t.integer :lesson_id
      t.integer :teacher_id

      t.timestamps null: false
    end
  end
end
