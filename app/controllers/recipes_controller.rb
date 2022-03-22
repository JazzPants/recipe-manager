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

    def create
      @recipe = Recipe.new(recipe_params)
      if @recipe.save
      redirect_to recipe_path(@recipe)
      else
        render :new
      end
    end
    
    def update
        @recipe = Recipe.find(params[:id])
        @recipe.update(recipe_params)
        redirect_to root_path(@user)
      end

    private
  
    def recipe_params
      params.require(:recipe).permit(:name, :procedure, :user_id)
    end
  end