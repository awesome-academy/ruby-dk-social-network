class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, foreign_keys: true
      t.references :post, foreign_keys: true
      t.timestamps
    end
  end
end
