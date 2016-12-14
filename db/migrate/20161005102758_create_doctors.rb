class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :speciality
      t.string :phone
      t.string :year_of_service

      t.timestamps
    end
  end
end
