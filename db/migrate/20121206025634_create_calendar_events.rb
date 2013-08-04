class CreateCalendarEvents < ActiveRecord::Migration
  def change
    create_table :calendar_events do |t|
      t.string :name
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end
  end
end
