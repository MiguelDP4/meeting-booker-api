class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :start
      t.datetime :finish
      t.references :user, null: false, foreign_key: true
      t.references :conference_room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
