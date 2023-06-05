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
  @patient.physicians.build
  @patient.appointments.build
end 

def create
 
  @patient = Patient.find(params[:patient_id])
  @appointment = @patient.appointments.build(appointment_params)
  
  if @appointment.save
    respond_to do |format|
      format.js { flash[:info] = "The user with an name of  has created!" }
     end
  else 
      render :new , status: :unprocessable_entity
  end 
end 

def edit
  @patient = Patient.find(params[:patient_id])
  @appointment = @patient.appointments.find(params[:id])
end

def update
  
  @patient = Patient.find(params[:patient_id])
  @physician = Physician.find(params[:physician_id])
  @appointment = Appointment.find(params[:id])
  
  #@appointment.update(appointment_params)
  if params["attr"] == "patient_name"
    
    @patient.update(name: params["appointment"]["patient"])
  else
    @physician&.update(name: params["appointment"]["physician"])
  end
  if @appointment.update(appointment_params)
    render json: { success: true }
  else
    render json: { success: false, errors: @user.errors.full_messages }
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
    params.require(:appointment).permit(:start_date, :patient_id, :physician_id, :end_date, physician_attributes:[:id, :name], patient_attributes:[:id, :name])
  end
end