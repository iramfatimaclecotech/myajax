class HomesController < ApplicationController

  def post_data
   
  end
    
  
  

  def post
    
  end
  
  def data
 
  end


     
 private
    def home_params
        params.require(:home).permit(:location)
    end
end

