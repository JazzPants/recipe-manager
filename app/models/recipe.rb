class Recipe < ActiveRecord::Base
    belongs_to :user
    has_many :ingredients
    has_many :comments, :through => :users
    has_many :ratings, :through => :users
end