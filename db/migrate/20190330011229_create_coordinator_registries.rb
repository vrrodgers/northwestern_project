class CreateCoordinatorRegistries < ActiveRecord::Migration[5.2]
  def change
    create_table :coordinator_registries do |t|
      t.references   :registries, foreign_key: true
      t.references   :coordinator, foreign_key: true
      t.timestamps
    end
  end
end
