class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :client
      t.references :engineer
      t.decimal :cost

      t.timestamps
    end
  end
end
