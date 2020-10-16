class AddNullableSeasonLaptimeReference < ActiveRecord::Migration[6.0]
  def change
    add_reference :laptimes, :season, null: true, foreign_key: true
  end
end
