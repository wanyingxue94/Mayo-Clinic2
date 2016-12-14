class Doctor < ActiveRecord::Base
	has_many :appointments
	has_many:prescriptions
	
	has_secure_password
	validates :password, :presence => true,
						 :length => { :minimum => 6}
	validates :phone, uniqueness: true
	
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :phone, presence: true
	validates :year_of_service, presence: true
	
	def self.search(search)
		where("name LIKE ? OR speciality LIKE ?", "%#{search}%", "%#{search}%") 	
	end
end
