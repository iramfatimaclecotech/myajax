class UsersController < ApplicationController
    
    def index
        @users = User.all
        # respond_to do |format|
        #     format.js { flash[:info] = "The article with an ID of #{@article.id} has had their admin attribute toggled!" }
        #   end
    end
      
    def show
        @user = User.find(params[:id])
        respond_to do |format|
            format.js { } 
        end  
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        #respond_to do |format|
        if @user.save
            respond_to do |format|
               format.js { flash[:info] = "The user with an name of #{@user.name} has created!" }
            end
        else
            render :new, status: :unprocessable_entity
      end
    end
    
    def edit
        @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
        if @user.update(user_params)
            # redirect_to @article
            respond_to do |format|
               format.js { flash[:info] = "The user with an ID of #{@user.id} has had their admin attribute toggled!" }
            end
        else
            render :edit, status: :unprocessable_entity
        end
    end
      
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        respond_to do |format|
            format.html { redirect_to user_url }
            # format.json { head :no_content }
            format.js   { render :layout => false }
        end
    end
        
    
 private
    def user_params
        params.require(:user).permit(:name)
    end
end

