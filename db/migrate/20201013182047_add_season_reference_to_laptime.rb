class AddSeasonReferenceToLaptime < ActiveRecord::Migration[6.0]
  def change
    add_reference :laptimes, :season, null: false, foreign_key: true
  end
end
