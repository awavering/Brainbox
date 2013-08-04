class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :contents

      t.integer :user_id
			t.references :commentable, :polymorphic => true

      t.timestamps
    end
  end
end
