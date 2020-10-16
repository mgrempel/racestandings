class RemoveLaptimeCircuitReference < ActiveRecord::Migration[6.0]
  def change
    remove_reference :laptimes, :circuit, null: false, foreign_key: true
  end
end
