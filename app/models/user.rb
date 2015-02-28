class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged

  validates_presence_of :username

  has_many :recipes

  has_many :favourite_recipes
  has_many :favourites, through: :favourite_recipes, source: :recipe

  def to_s
    username
  end

end
