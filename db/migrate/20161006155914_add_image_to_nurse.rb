class AddImageToNurse < ActiveRecord::Migration
  def change
  add_column :nurses, :image, :string
  end
end
