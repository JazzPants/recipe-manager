class CreateIngredients < ActiveRecord::Migration[4.2]
    def change
      create_table :ingredients do |t|
        t.belongs_to :recipe
        t.string   :name
        t.string   :quantity
      end
    end
  end