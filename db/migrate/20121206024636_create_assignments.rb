class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.datetime :due
      t.datetime :late
      t.string :category
      t.string :description

      t.integer :section_id

      t.timestamps
    end
  end
end
