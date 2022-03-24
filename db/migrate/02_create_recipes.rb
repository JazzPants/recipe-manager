class CreateRecipes < ActiveRecord::Migration[4.2]
    def change
      create_table :recipes do |t|
        t.belongs_to :user
        t.string :title
        t.string :procedure
  
        t.timestamps
      end
    end
  end