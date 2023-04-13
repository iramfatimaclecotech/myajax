class PostsController < ApplicationController


  def privacy_policy

  end

def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)
    redirect_to user_path(@user)
end

def edit
    @user = User.find(params[:user_id])
    @post =  Post.find(params[:id])
end

  def update
    @user = User.find(params[:user_id])
    @post =  @user.posts.find(params[:id])
    if @post.update(post_params)
      respond_to do |format|
        format.js { flash[:info] = "The article with an ID of #{@post.id} has had their admin attribute toggled!" }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
       format.html { redirect_to post_url }
       format.js   { render :layout => false }
    end
  end
    
    
private
    def post_params
        params.require(:post).permit(:post_name, :post_details,:id)
    end

end
