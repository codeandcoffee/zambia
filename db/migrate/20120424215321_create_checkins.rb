class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.string :location
      t.string :username

      t.timestamps
    end
  end
end
