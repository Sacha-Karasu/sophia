class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :location
      t.datetime :start_date
      t.datetime :end_date
      t.text :description
      t.string :password
      t.boolean :motion
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
