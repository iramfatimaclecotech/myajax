class SharksController < ApplicationController
  before_action :set_shark, only: %i[ show edit update destroy ]

  # def index
  #   @sharks = Shark.all
  #   respond_to do |format|
  #     format.html
  #     format.csv { send_data @sharks.to_csv}
  #   end
  # end

  def index
    @sharks = Shark.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Player id: #{@sharks.count}", template: "sharks/index.html.erb"
      end
    end
  end

  def show
  end

  def new
    @shark = Shark.new
  end

  def edit
  end

  def create
    @shark = Shark.new(shark_params)

    respond_to do |format|
      if @shark.save
        format.html { redirect_to shark_url(@shark), notice: "Shark was successfully created." }
        format.json { render :show, status: :created, location: @shark }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shark.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @shark.update(shark_params)
        format.html { redirect_to shark_url(@shark), notice: "Shark was successfully updated." }
        format.json { render :show, status: :ok, location: @shark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shark.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shark.destroy

    respond_to do |format|
      format.html { redirect_to sharks_url, notice: "Shark was successfully destroyed." }
      format.json { head :no_content }
    end
  end










  

  private
    def set_shark
      @shark = Shark.find(params[:id])
    end

    def shark_params
      params.require(:shark).permit(:name, :facts)
    end
end
