class CardsController < ApplicationController
  
    def index
        @cards = Card.all
        # respond_to do |format|
        #     format.js { flash[:info] = "The article with an ID of #{@card.id} has had their admin attribute toggled!" }
        #   end
    end
      
    def show
  
      @card = Card.find(params[:id])
      respond_to do |format|
        format.js { render(:text => "not implemented") } 
      end
      
    end
    
    def new
        @card = Card.new
    end
    
    def create
        @card = Card.new(card_params)
        #respond_to do |format|
        if @card.save
            respond_to do |format|
               format.js { flash[:info] = "The user with an name of #{@card.name} has created!" }
            end
        else
            render :new, status: :unprocessable_entity
      end
    end
    
    def edit
        @card = Card.find(params[:id])
    end

    def update
      @card = Card.find(params[:id])
        if @card.update(card_params)
            # redirect_to @article
            respond_to do |format|
               format.js { flash[:info] = "The user with an ID of #{@card.id} has had their admin attribute toggled!" }
            end
        else
            render :edit, status: :unprocessable_entity
        end
    end
      
    def destroy
        @card = Card.find(params[:id])
        @card.destroy
        respond_to do |format|
            format.html { redirect_to user_url }
            # format.json { head :no_content }
            format.js   { render :layout => false }
        end
    end 
 private
    def card_params
      params.require(:card).permit(:name,:header,:rating,images: [])
    end
end

