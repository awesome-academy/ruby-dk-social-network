class CreateGenerals < ActiveRecord::Migration[5.2]
  def change
    create_table :generals do |t|

      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end
