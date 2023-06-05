 class AppointmentsController < ApplicationController
  def index
    # @patient = Patient.find(params[:patient_id])
   # @physician = Physician.find(params[:physician_id])
    @appointments = Appointment.all
    respond_to do |format|
      format.js { flash[:info] = "The user with an name of  has created!" }
   end
end

def show
  @patient=Patient.find(params [:patient_id])
  @appointment = Appointment.find(params[:id])
  respond_to do |format|
    format.js { flash[:info] = "The user with an name of  has created!" }
  end
end

def new 
  @patient = Patient.find(params[:patient_id])
  @pationt.physicians.build
  @patient.appointments.build
end 

def create
  @patient = Patient.find(params[:patient_id])
  @appointment = @patient.appointments.build(appointment_params)
  if @appointment.save
    #@redirect_to @patients
      respond_to do |format|
        format.js { flash[:info] = "The user with an name of  has created!" }
     end

  else 
      render :new , status: :unprocessable_entity
  end 
end 

def edit
  @patient = Patient.find(params[:patient_id])
  @appointment =  Appointment.find(params[:id])
end

def update
  @appointment =  Appointment.find(params[:id])

  if @appointment.update(appointment_params)
   # redirect_to @article
    respond_to do |format|
      format.js { flash[:info] = "The article with an ID of #{@appointment.id} has had their admin attribute toggled!" }
    end
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  @appointment = Appointment.find(params[:id])
  @appointment.destroy
  respond_to do |format|
     format.html { redirect_to article_url }
    # format.json { head :no_content }
     format.js   { render :layout => false }
  end
end


private
  def appointment_params
    params.require(:appointment).permit(:start_date, :physician_id, :patient_id,:end_date)
  end
end

