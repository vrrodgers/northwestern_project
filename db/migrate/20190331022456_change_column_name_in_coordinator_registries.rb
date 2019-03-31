class ChangeColumnNameInCoordinatorRegistries < ActiveRecord::Migration[5.2]
  def change
    rename_column :coordinator_registries, :registries_id, :registry_id
  end
end
