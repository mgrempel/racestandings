class AddDriverRefToLaptTimes < ActiveRecord::Migration[6.0]
  def change
    add_reference :laptimes, :driver, null: false, foreign_key: true
  end
end
