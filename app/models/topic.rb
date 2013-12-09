class Topic < ActiveRecord::Base
  has_and_belongs_to_many :tags
  belongs_to :category

  extend FriendlyId
  friendly_id :title, use: :slugged
end
