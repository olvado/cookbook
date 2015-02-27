class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged

  validates_presence_of :username

  has_many :recipes

  def to_s
    username
  end

end
