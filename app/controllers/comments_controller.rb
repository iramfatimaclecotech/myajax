class CommentsController < ApplicationController

def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
end

def edit
    @article = Article.find(params[:article_id])
    @comment =  Comment.find(params[:id])
end

  def update
    @article = Article.find(params[:article_id])
    @comment =  @article.comments.find_by(params[:id])
    if @comment.update(comment_params)
      respond_to do |format|
        format.js { flash[:info] = "The article with an ID of #{@comment.id} has had their admin attribute toggled!" }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
       format.html { redirect_to comment_url }
       format.js   { render :layout => false }
    end
  end
    
    
private
    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end
end
