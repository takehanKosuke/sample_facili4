class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :room_number
      t.string :textbook
      t.string :referencebook
      t.integer :period
      t.string :wday
      t.integer :unit
      t.integer :lesson_information_id

      t.timestamps null: false
    end
  end
end
