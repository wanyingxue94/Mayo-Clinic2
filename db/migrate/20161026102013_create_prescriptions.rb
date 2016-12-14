class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.text :prescription_details
      t.date :prescription_date
      t.integer :patient_id
      t.integer :doctor_id

      t.timestamps
    end
  end
end
