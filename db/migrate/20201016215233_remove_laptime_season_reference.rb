class RemoveLaptimeSeasonReference < ActiveRecord::Migration[6.0]
  def change
    remove_reference :laptimes, :season, null: false, foreign_key: true
  end
end
