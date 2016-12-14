class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :date
      t.time :time
      t.string :duration
      t.text :appointment_reason
      t.integer :patient_id
      t.integer :doctor_id
      t.integer :nurse_id

      t.timestamps
    end
  end
end
