class SessionsController < ApplicationController

#before_action :authorise, :except => [:new,:edit, :create]
  def new
  end

  def create
	patient = Patient.find_by_email(params[:email])
	if patient && patient.authenticate(params[:password])
		session[:patient_id] = patient.id		#store id of the user in the session is user found by email and password
		redirect_to root_path	
		flash.now[:error] = "Invalid email and password combination."		#displays the user/show view redirect_to user
	else
		flash.now[:error] = "Invalid email and password combination."
		render 'new'
	end
  end

  def destroy
	if signed_in?
		session[:patient_id] = nil
	else
		flash[:notice] = "You have to be signed in"
	end
	redirect_to login_path
  end
  
  def doctornew
  end
  
  def doctorcreate
  
	doctor = Doctor.find_by_email(params[:email])
	if doctor && doctor.authenticate(params[:password])
		session[:doctor_id] = doctor.id		#store id of the user in the session is user found by email and password
		redirect_to root_path
		flash.now[:error] = "Invalid email and password combination."		#displays the user/show view redirect_to user
	else
		flash.now[:error] = "Invalid email and password combination."
		render 'docternew'
	end
  end  
  
  def doctordestroy
	if doctorsigned_in?
		session[:doctor_id] = nil
	else
		flash[:notice] = "You have to be signed in"
	end
	redirect_to login_path
  end


  def nursenew
  end
  
  def nursecreate
	nurse = Nurse.find_by_email(params[:email])
	if nurse && nurse.authenticate(params[:password])
		session[:nurse_id] = nurse.id		#store id of the user in the session is user found by email and password
		redirect_to root_path
		flash.now[:error] = "Invalid email and password combination."		#displays the user/show view redirect_to user
	else
		flash.now[:error] = "Invalid email and password combination."
		render 'nursenew'
	end
  end  
  
  def nursedestroy
	if nursesigned_in?
		session[:nurse_id] = nil
	else
		flash[:notice] = "You have to be signed in"
	end
	redirect_to login_path
  end


end
