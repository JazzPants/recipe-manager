class CreateComments < ActiveRecord::Migration[4.2]
    def change
      create_table :comments do |t|
        t.string :content
        t.belongs_to :user, foreign_key: true
        t.timestamps
      end
    end
  end