class CreateIngredientsRecipes < ActiveRecord::Migration[4.2]
    def change
      create_table :ingredients_recipes, id: false do |t|
        t.belongs_to :ingredient, foreign_key: true
        t.belongs_to :recipe, foreign_key: true
      end
    end
  end