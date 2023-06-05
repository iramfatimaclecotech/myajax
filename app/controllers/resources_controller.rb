class ResourcesController < ApplicationController
  def index
  end

  # def search
  #   @search = Resource.search(:include => [:creators]) do
  #     keywords(params[:q])
  #   end
  #     @title = "Search results for "+params[:q]
  #     @resources = @search.results
  #     respond_to do |format|
  #       format.html { render 'resources/index' }
  #       format.json { render 'resources/search' }
  #     end
  #   end
end
