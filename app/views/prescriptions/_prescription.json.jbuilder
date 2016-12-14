json.extract! prescription, :id, :prescription_details, :prescription_date, :patient_id, :doctor_id, :created_at, :updated_at
json.url prescription_url(prescription, format: :json)