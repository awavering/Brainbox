class CreateSuperFiles < ActiveRecord::Migration
  def change
    create_table :super_files do |t|
      t.string :name
      t.integer :size
      t.string :url
      t.string :mimetype

			t.integer :user_id
      t.references :fileable, :polymorphic => true

      t.timestamps
    end
  end
end
