class RenameDriverColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :rides, :service_id, :driver_id
  end
end
