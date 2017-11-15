class CreateDrawings < ActiveRecord::Migration[5.1]
  def change
    create_table :drawings do |t|
      t.integer :user_id, :null => false
      t.string :color_code,  :null => false
      t.string :drawing_area, :null => false
      t.index :user_id

      t.timestamps
    end
  end
end
