class CreateGenerals < ActiveRecord::Migration[5.2]
  def change
    create_table :generals do |t|
      t.references :user, foreign_keys: true
      t.references :post, foreign_keys: true
      t.integer :generalable_id
      t.string :generalable_type

      t.timestamps
    end
  end
end
