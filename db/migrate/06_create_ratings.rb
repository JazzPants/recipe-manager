class CreateRatings < ActiveRecord::Migration[4.2]
    def change
      create_table :ratings do |t|
        t.integer :rating
        t.belongs_to :user, foreign_key: true
        t.timestamps
      end
    end
  end