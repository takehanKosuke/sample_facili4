class AddPeriodToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :period, :integer
  end
end
