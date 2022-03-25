class Ingredient < ActiveRecord::Base
  validates :name, presence: true
  validates :quantity, presence: true
    belongs_to :recipe
  end