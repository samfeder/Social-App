class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.integer :owner_id, null: false

      t.timestamps
    end
    add_index :circles, :owner_id
  end
end
