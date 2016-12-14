class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :doctorauthorise, :except => [:new,:create, :edit, :show, :index, :search, :update]
  # before_action :nurseauthorise, :except => [:new,:create, :edit, :show]
  # GET /patients
  # GET /patients.json
 
  
  def index
    @patients = Patient.all
	for p in @patients
		now = Time.now.utc.to_date
		birthday = p.date_of_birth.to_date
	    p.date_of_birth = now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
	end
  end
  
  def patientsearch
	@patients = Patient.patientsearch params[:query1]
	unless @patients.empty?
		flash[:notice] = ''
		render 'index'
	else
		flash[:notice] = 'No record matches your search'
		@patients = Patient.all
		render 'index'
	end
	
  end
  
  # GET /patients/1
  # GET /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end
	
  
 def regular_patients
	@patients = Patient.where(regular: true)
	render 'index'
 end
  
  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
		Usermailer.welcome(@patient).deliver
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
		
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :regular, :gender, :address, :city, :state, :date_of_birth, :phone, :email, :password, :password_confirmation, :attachment)
    end
end
