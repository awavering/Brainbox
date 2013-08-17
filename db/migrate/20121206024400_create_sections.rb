class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.datetime :start
      t.datetime :finish
      t.string :location
      t.integer :capacity
      t.text :description
      t.text :announcements

      t.integer :course_id

      t.timestamps
    end
  end
end
