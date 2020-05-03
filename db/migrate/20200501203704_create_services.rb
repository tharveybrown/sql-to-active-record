class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table(:drivers) do |t|
      t.string :name
      t.float :rating
      t.integer :rating
      t.string :service_type
    end
  end
end
