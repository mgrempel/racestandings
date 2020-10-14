class AddDriveridToDrivers < ActiveRecord::Migration[6.0]
  def change
    add_column :drivers, :driverid, :string
  end
end
