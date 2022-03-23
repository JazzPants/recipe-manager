class CreateIngredientsRecipes < ActiveRecord::Migration[4.2]
    def change
      create_table :ingredients_recipes, id: false do |t|
        t.belongs_to :ingredient, foreign_key: true
        t.belongs_to :recipe, foreign_key: true
      end
      add_index(:ingredients_recipes, [:ingredient_id, :recipe_id], :unique => true)
    end
  end