class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :patient_id
      t.integer :appointment_id
      t.integer :stars

      t.timestamps
    end
  end
end
