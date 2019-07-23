class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_keys: true
      t.references :post, foreign_keys: true
      t.text :content
      t.integer :parent_id

      t.timestamps
    end
  end
end
