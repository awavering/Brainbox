class CreateSchoolUserJoinTable < ActiveRecord::Migration
  def change
    create_table :schools_users, :id => false do |t|
      t.integer :school_id
      t.integer :user_id
    end
  end
end