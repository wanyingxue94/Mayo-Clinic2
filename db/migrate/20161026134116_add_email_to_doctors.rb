class AddEmailToDoctors < ActiveRecord::Migration
  def change
	add_column :doctors, :email, :string
	add_column :doctors, :password_digest, :string
  end
end
