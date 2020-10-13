class AddDriverRefToLaptTimes < ActiveRecord::Migration[6.0]
  def change
    add_reference :lapt_times, :driver, null: false, foreign_key: true
  end
end
