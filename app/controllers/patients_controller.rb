class PatientsController < ApplicationController

  def index
    
    @patients = Patient.all
  #   respond_to do |format|
  #     format.js { flash[:info] = "The user with an name of  has created!" }
  #  end

  end

  def show
    @patient = Patient.find(params[:id])
    respond_to do |format|
      format.js { flash[:info] = "The user with an name of  has created!" }
   end
  end

  def new
    
    @patient = Patient.new
    # @pationt.physicians.build
    # @pationt.appointments.build
  end

  def create
    
    @patient = Patient.create(patient_params)
    if @patient.save
      respond_to do |format|
        format.js { flash[:info] = "The user with an name of  has created!" }
     end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient= Patient.find(params[:id])

    if @Patient.update(patient_params)
      respond_to do |format|
        format.js { flash[:info] = "The user with an name of  has created!" }
     end
     
      
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    redirect_to root_path, status: :see_other
  end


  private
    def patient_params
      params.require(:patient).permit(:name)
    end




end
