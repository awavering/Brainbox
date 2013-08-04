class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :note
      t.datetime :submitted

      t.integer :user_id
      t.integer :assignment_id

      t.timestamps
    end
  end
end
