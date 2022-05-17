class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.text :description
      t.datetime :event_date
      t.integer :creator_id

      t.timestamps
    end
  end
end
