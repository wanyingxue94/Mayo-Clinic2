json.extract! appointment, :id, :date, :time, :duration, :appointment_reason, :patient_id, :doctor_id, :nurse_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)