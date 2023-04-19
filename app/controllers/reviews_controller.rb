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
        redirect_to card_path(@card)
    else
      flash[:notice] = "Error creating review: #{@review.errors}"
    end
  end

  def edit
     @card = Card.find(params[:card_id])
      @review = Review.find(params[:id])
   end

  def update
   @card = Card.find(params[:card_id])
    @review = Review.find(params[:id])

    if @review.update(review_params)
      respond_to do |format|
        format.js { flash[:info] = "The review with an name of has created!" }
     end
     redirect_to card_path(@card)
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
    redirect_to card_path(@card)
  end

  private
    def review_params
      params.require(:review).permit(:id,:username,:body, :rating,:card_id)
    end
end


