class PhysiciansController < ApplicationController

  def index

    @physicians = Physician.all
  #   respond_to do |format|
  #     format.js { flash[:info] = "The user with an name of  has created!" }
  #  end
  end

  def show
    @physician = Physician.find(params[:id])
    respond_to do |format|
      format.js { flash[:info] = "The user with an name of  has created!" }
   end
  end

  def new
   
    @patient = Patient.find(params[:patient_id])
    @physician = Physician.new
  end

  def create
    
    @patient = Patient.find(params[:patient_id])
    @physician = Physician.new(physician_params)
    if @physician.save
      respond_to do |format|
        format.js { flash[:info] = "The user with an name of  has created!" }
     end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @physician = Physician.find(params[:id])
  end

  def update
    @physician = Physician.find(params[:id])

    if @physician.update(physician_params)
      respond_to do |format|
        format.js { flash[:info] = "The user with an name of  has created!" }
     end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @physician = Physician.find(params[:id])
    @physician.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def physician_params
      params.require(:physician).permit(:name)
    end
  end

end
