class CreateMultis < ActiveRecord::Migration[5.2]
  def change
    create_table :multis do |t|
      t.references :post, foreign_keys: true
      t.integer :multiable_id
      t.string :multiable_type

      t.timestamps
    end
  end
end
