class ReviewsController < ApplicationController


  def index
    @reviews= Review.all
  end

  def show
    @card = Card.find(params[:card_id])
    @review = Review.find(params[:id])
    respond_to do |format|
      format.js { flash[:info] = "The user with an name of #{@review.username} has created!" }
   end
  end

  # def new 
  #   debugger
  #   @review = Review.new
  # end

  def create
    @card = Card.find(params[:card_id])
    @review = @card.reviews.create(review_params)
    if @review.save
      flash[:notice] = 'Review was successfully created.'
        respond_to do |format|
          format.js { flash[:info] = "The user with an name of #{@review.card_id} has created!" }
        end 
    else
      flash[:notice] = "Error creating review: #{@review.errors}"
    end
  end

  def edit
    debugger
     @card = Card.find(params[:card_id])
      @review = Review.find(params[:id])
   end

  def update
   @card = Card.find(params[:card_id])
    @review = Review.find(params[:id])

    if @review.update_attributes(review_params)
      flash[:notice] = "Review updated"
      respond_to do |format|
        format.js { flash[:info] = "The user with an name of has created!" }
     end
    else
      flash[:error] = "There was an error updating your review"
      
    end
  end

  def destroy
    @card = Card.find(params[:card_id])
    @review = Review.find(params[:id])
    @review.destroy
    respond_to do |format|
      format.js { flash[:info] = "The user with an name of #{@user.name} has created!" }
    end
  end

  private
    def review_params
      params.require(:review).permit(:username, :body, :rating,:card_id)
    end
end


