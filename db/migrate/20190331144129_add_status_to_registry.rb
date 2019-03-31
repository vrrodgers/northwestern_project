class AddStatusToRegistry < ActiveRecord::Migration[5.2]
  def change
    add_column :registries, :status, :integer, default: 0
    add_column :enrollments, :status, :integer, default: 0
  end
end
