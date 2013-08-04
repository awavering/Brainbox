class CreateParentUserJoinTable < ActiveRecord::Migration
  def change
    create_table :parents_users, :id => false do |t|
      t.integer :parent_id
      t.integer :user_id
    end
  end
end