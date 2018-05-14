class CreateGreads < ActiveRecord::Migration
  def change
    create_table :greads do |t|
      t.integer :gread

      t.timestamps null: false
    end
  end
end
