class Recipe < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  acts_as_taggable_on :ingredients

  belongs_to :user

  has_many :favourite_recipes
  has_many :favourited_by, through: :favourite_recipes, source: :user

  def to_s
    title
  end

end
