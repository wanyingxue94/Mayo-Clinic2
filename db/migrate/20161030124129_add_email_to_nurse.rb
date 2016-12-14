class AddEmailToNurse < ActiveRecord::Migration
  def change
	add_column :nurses, :email, :string
	add_column :nurses, :password_digest, :string
  end
end
