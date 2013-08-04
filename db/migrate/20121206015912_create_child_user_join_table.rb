class CreateChildUserJoinTable < ActiveRecord::Migration
  def change
    create_table :children_users, :id => false do |t|
      t.integer :child_id
      t.integer :user_id
    end
  end
end