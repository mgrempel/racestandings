class CreateCircuits < ActiveRecord::Migration[6.0]
  def change
    create_table :circuits do |t|
      t.string :name
      t.string :locality
      t.string :country
      t.string :url

      t.timestamps
    end
  end
end
