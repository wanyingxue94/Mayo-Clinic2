class AddRegularToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :regular, :boolean
  end
end
