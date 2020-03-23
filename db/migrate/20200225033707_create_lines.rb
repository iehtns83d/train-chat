class CreateLines < ActiveRecord::Migration[5.0]
  def change
    create_table :lines do |t|
      t.string :name, null: false
      t.index :name, unique: true
      t.string :image, null: false
      t.timestamps
    end
  end
end
