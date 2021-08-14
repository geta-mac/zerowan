class CreateDmRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :dm_rooms do |t|
      t.integer :pet_id
      t.integer :user_id
      t.integer :send_user_id

      t.timestamps
    end
  end
end
