class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :date
      t.string :start_time
      t.string :end_time
      t.references :space, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
