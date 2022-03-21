class RecipesController < ApplicationController
    def new
      @recipe = Recipe.new(user_id: params[:user_id])
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
    #   @recipe = Recipe.create(user_params)
    #   return redirect_to controller: 'recipes', action: 'new' unless @recipe.save
    #   session[:user_id] = @user.id
    #   redirect_to controller: 'recipe', action: 'index'
    # end
    
    def update
        @recipe = Recipe.find(params[:id])
        @recipe.update(recipe_params)
        redirect_to recipe_path(@post)
      end

    private
  
    def recipe_params
      params.require(:recipe).permit(:name, :procedure, :user_id)
    end
  end