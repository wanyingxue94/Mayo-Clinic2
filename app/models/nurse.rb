class Nurse < ActiveRecord::Base
	has_many :appointments
	
	has_secure_password
	validates :phone, uniqueness: true
	
	validates :name, presence: true
	validates :phone, presence: true
	validates :year_of_service, presence: true
	
	
end
