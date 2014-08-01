class RenameNameColumnToVideoId < ActiveRecord::Migration
  def change

    rename_column :timetables, :train_id, :video_id

  end
end
