class AddCircleName < ActiveRecord::Migration
  def change
    add_column :circles, :name, :string
    change_column :circles, :name, :string, null: false
  end
end
