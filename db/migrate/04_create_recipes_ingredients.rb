class CreateRecipesIngredients < ActiveRecord::Migration[4.2]
    def change
      create_table :recipes_ingredients, id: false do |t|
        t.belongs_to :recipe, foreign_key: true
        t.belongs_to :ingredient, foreign_key: true
      end
    end
  end