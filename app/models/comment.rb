class Comment < ActiveRecord::Base
	belongs_to :patient
	belongs_to :appointment
	
	
end
