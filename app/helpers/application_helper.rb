module ApplicationHelper
	def signed_in?
		if session[:patient_id].nil?
			return
		else
			@current_patient = Patient.find_by_id(session[:patient_id])
		end
	end
	
	
	def doctorsigned_in?
		if session[:doctor_id].nil?
			return
		else
			@current_doctor = Doctor.find_by_id(session[:doctor_id])
		end
	end
	
	
	def nursesigned_in?
		if session[:nurse_id].nil?
			return
		else
			@current_nurse = Nurse.find_by_id(session[:nurse_id])
		end
	end
	
	def euro(amount)
		number_to_currency(amount, :unit => '€')
	end
end
