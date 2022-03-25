class Recipe < ActiveRecord::Base
    validates :title, presence: true
    validates :procedure, presence: true, length: {in: 5..200}
    has_many :ingredients, dependent: :delete_all
    accepts_nested_attributes_for :ingredients
  end