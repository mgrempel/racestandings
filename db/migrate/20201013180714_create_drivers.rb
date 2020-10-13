class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :url

      t.timestamps
    end
  end
end
