class CreateTimetable < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.integer :train_id
      t.string :start_location
      t.timestamps :departure_time
      t.string :final_location
      t.timestamps :arrival_time

    end
  end
end
