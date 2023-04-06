class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    # respond_to do |format|
    #     format.js { flash[:info] = "The article with an ID of #{@article.id} has had their admin attribute toggled!" }
    #   end
  end
  
  def show
    @article = Article.find(params[:id])
      respond_to do |format|
        format.js { flash[:info] = "The article with an ID of #{@article.id} has had their admin attribute toggled!" }
      end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      respond_to do |format|
        format.js { flash[:info] = "The article with an ID of #{@article.id} has had their admin attribute toggled!" }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
     # redirect_to @article
      respond_to do |format|
        format.js { flash[:info] = "The article with an ID of #{@article.id} has had their admin attribute toggled!" }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
       format.html { redirect_to article_url }
      # format.json { head :no_content }
       format.js   { render :layout => false }
    end
  end
    

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
