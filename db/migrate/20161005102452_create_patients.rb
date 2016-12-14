class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :state
      t.date :date_of_birth
      t.string :phone
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
