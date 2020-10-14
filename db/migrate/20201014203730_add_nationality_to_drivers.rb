class AddNationalityToDrivers < ActiveRecord::Migration[6.0]
  def change
    add_column :drivers, :nationality, :string
  end
end
