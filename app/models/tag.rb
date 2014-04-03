class Tag < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_and_belongs_to_many :posts

  attr_accessible :name

  validates :name, presence: true, uniqueness: true

end