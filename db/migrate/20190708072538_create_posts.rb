class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_keys: true
      t.text :content
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
