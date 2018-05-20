class CreateLessonUsers < ActiveRecord::Migration
  def change
    create_table :lesson_users do |t|
      t.integer :lesson_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :lesson_users, [:lesson_id, :user_id], unique: true
  end
end
