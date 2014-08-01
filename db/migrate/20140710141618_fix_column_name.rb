class FixColumnName < ActiveRecord::Migration
  def change

    rename_column :timetables, :created_at, :departure_time
    rename_column :timetables, :updated_at, :arrival_time

  end
end
