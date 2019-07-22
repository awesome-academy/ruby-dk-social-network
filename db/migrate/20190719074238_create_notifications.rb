class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_keys: true
      t.string :event

      t.timestamps
    end
  end
end
