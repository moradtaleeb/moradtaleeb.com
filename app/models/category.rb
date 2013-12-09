class Category < ActiveRecord::Base
  has_many :topics
  has_many :tags

  extend FriendlyId
  friendly_id :title, use: :slugged
end
