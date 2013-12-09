class Tag < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :topics

  extend FriendlyId
  friendly_id :title, use: :slugged
end
