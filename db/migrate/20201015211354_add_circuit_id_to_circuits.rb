class AddCircuitIdToCircuits < ActiveRecord::Migration[6.0]
  def change
    add_column :circuits, :circuitid, :string
  end
end
