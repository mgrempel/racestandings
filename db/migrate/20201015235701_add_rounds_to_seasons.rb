class AddRoundsToSeasons < ActiveRecord::Migration[6.0]
  def change
    add_column :seasons, :round, :integer
  end
end
