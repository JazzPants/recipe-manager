class User < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  validates :password, length: { in: 4..20 }
    has_secure_password
    has_many :recipes
    has_many :comments, :through => :recipes
    has_many :ratings, :through => :recipes
  end