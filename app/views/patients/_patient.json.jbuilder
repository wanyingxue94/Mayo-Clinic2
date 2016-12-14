json.extract! patient, :id, :first_name, :last_name, :address, :city, :state, :date_of_birth, :phone, :email, :password_digest, :created_at, :updated_at
json.url patient_url(patient, format: :json)