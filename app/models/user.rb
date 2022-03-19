class User < ActiveRecord::Base
    has_secure_password
    has_many :recipes
    has_many :comments, :through => :recipes
    has_many :ratings, :through => :recipes
  end