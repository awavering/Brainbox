class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name

      t.integer :school_id

      t.timestamps
    end
  end
end
