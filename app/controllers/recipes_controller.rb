class RecipesController < ApplicationController
    def new
      if params[:user_id] && !User.exists?(params[:user_id])
        flash[:notice] = "That user (#{params[:user_id]}) does not exist!"
        redirect_to new_user_recipe_path(@user)
      else
        @recipe = Recipe.new(user_id: params[:user_id])
        @ingredient = Ingredient.new(name: params[:name])
        ingredientsList
      end

    end

    def edit
      ingredientsList
      @recipe = Recipe.find(params[:id])
    end

    def index
        if params[:user_id]
            @recipes = User.find(params[:user_id]).recipes
          else
            @recipes = Recipe.all
          end
    end

    def show
        ingredientsList
        @recipe = Recipe.find(params[:id])
    end

    def create
      @recipe = Recipe.new(recipe_params)
      @ingredient = Ingredient.new(ingredient_params)
      if @recipe.save && @ingredient.save
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

      def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        flash[:notice] = "Recipe '#{@recipe.name}' deleted."
        puts "Recipe deleted!"
        redirect_to user_recipes_path(@user)
      end

    private
  
    def recipe_params
      params.require(:recipe).permit(:name, :procedure, :user_id, :ingredient_name)
    end

    def ingredient_params
      params.require(:ingredient).permit(:name)
    end

    def ingredientsList
      @ingredientsList = []
      ingredientsJoin = IngredientsRecipes.all.where(recipe_id: params[:id])    
      ingredientsJoin.each do |i|
        @ingredientsList << Ingredient.find_by(id: i.ingredient_id).name
      end
    end


  end