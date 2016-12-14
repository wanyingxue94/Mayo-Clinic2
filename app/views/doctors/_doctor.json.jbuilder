json.extract! doctor, :id, :name, :speciality, :phone, :year_of_service, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)