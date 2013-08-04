class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :location
      t.string :logo
      t.string :style

      t.timestamps
    end
  end
end
