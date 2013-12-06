class Topic < ActiveRecord::Base
  has_many :tags
  belongs_to :category
end
