class SearchesController < ApplicationController
  def index
    @searches =  Search.all
  end

  def show
    @search = Search.find(params[:id])
    respond_to do |format|
      format.html { render(:text => "not implemented") }
      format.js
    end
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    if @search.save
      respond_to do |format|
        format.js { flash.now[:success] = "The search name with an ID of #{@search.name} has created"
                                    flash.now[:success] = 'successul created.' }
    end
      
    else
        render :edit, status: :unprocessable_entity
    end
  end

private
    def search_params
      params.require(:search).permit(:name,:type)
    end
end