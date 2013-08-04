class CreateTeacherSectionJoinTable < ActiveRecord::Migration
  def change
    create_table :teachers_sections, :id => false do |t|
      t.integer :user_id
      t.integer :section_id
    end
  end
end