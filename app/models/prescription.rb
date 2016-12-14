class Prescription < ActiveRecord::Base
	belongs_to :patient
	belongs_to :doctor
	
	validates :prescription_details, presence: true
	validates :prescription_date, presence: true
	
	def apply_discount(precription, discount)
		if !precription.nil?
		precription.price = precription.price - precription.price * discount
		end
	end
end
