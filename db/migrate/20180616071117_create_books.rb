class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.text :name_text
      t.text :author
      t.integer :list_price
      t.integer :ctext_lassification
      t.integer :lesson_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
