class Records < ActiveRecord::Migration
  def change
    drop_table :lesson_teachers
  end
end
