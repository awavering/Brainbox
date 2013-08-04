class AddPreferencesToUser < ActiveRecord::Migration
  def change
    add_column :users, :preferences, :string
  end
end
