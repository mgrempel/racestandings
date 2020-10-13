class CreateJoinTableCircuitSeason < ActiveRecord::Migration[6.0]
  def change
    create_join_table :circuits, :seasons do |t|
      # t.index [:circuit_id, :season_id]
      # t.index [:season_id, :circuit_id]
    end
  end
end
