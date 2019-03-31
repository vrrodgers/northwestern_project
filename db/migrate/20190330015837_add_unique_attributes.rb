class AddUniqueAttributes < ActiveRecord::Migration[5.2]
  def change
    add_index :registries, :name, unique: true
    add_index :registries, :location, unique: true
    add_index :coordinators, :email, unique: true
  end
end
