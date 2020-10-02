class CreateConferenceRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :conference_rooms do |t|
      t.integer :size
      t.boolean :projector

      t.timestamps
    end
  end
end
