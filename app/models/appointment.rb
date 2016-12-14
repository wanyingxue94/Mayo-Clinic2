class Appointment < ActiveRecord::Base
	belongs_to :patient
	belongs_to :doctor
	belongs_to :nurse
	has_many :comments, :dependent => :destroy
	
	validates :date, presence: true
	validates :time, presence: true
	validates :duration, presence: true
	validates :appointment_reason, presence: true
	validates :patient_id, presence: true
	validates :doctor_id, presence: true
	validates :nurse_id, presence: true
	
	
	validate :expiration_date_cannot_be_in_the_past
	
	DURATION_LIST = ["10 Mins","20 Mins","30 Mins"]
	
	validates_uniqueness_of :doctor_id, scope: [:date, :time]
	
	def expiration_date_cannot_be_in_the_past
		if date.present? && date < Date.today
			errors.add(:date, "can't be in the past")
    end
  end  
	
	def average_stars
		comments.average(:stars)
	end
	
	
	
end
