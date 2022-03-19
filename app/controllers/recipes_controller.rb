class RecipesController < ApplicationController
    def new
    end

    def index
        if params[:user_id]
            @recipes = User.find(params[:user_id]).recipes
          else
            @recipes = Recipe.all
          end
    end

    def show
        @recipe = Recipe.find(params[:id])
    end
  
    # def create
    #   @user = User.create(user_params)
    #   return redirect_to controller: 'users', action: 'new' unless @user.save
    #   session[:user_id] = @user.id
    #   redirect_to controller: 'welcome', action: 'home'
    # end
  
    # private
  
    # def user_params
    #   params.require(:user).permit(:name, :password, :password_confirmation)
    # end
  end