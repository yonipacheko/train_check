class RenameNameColumnToTrainId < ActiveRecord::Migration
  def change
    rename_column :timetables, :video_id, :train_id

  end
end
