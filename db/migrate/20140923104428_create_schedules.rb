class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :day_of_week
      t.string :start_time
      t.string :end_time
      t.references :space, index: true

      t.timestamps
    end
  end
end
