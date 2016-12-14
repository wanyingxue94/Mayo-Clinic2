class CommentsController < ApplicationController
	before_action :authorise
	
	def create
		@appointment = Appointment.find params[:appointment_id]
		@comment = @appointment.comments.new(comment_params)
		@comment.patient_id = @current_patient.id
		@comment.save
		
		
		respond_to do |format|
			format.html{redirect_to @appointment}
		end
	end
	
	
	private
	def comment_params	
		params.require(:comment).permit(:content, :appointment_id, :patient_id, :stars)
	end
end
