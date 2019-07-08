class CreateGenerals < ActiveRecord::Migration[5.2]
  def change
    create_table :generals do |t|

      t.timestamps
    end
  end
end
