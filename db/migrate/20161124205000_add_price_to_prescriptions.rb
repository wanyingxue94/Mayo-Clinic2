class AddPriceToPrescriptions < ActiveRecord::Migration
  def change
    add_column :prescriptions, :price, :decimal
  end
end
