class Work < ActiveRecord::Base
  belongs_to :user
  has_many :problematics
  has_many :links, as: :linkable
  has_many :ideas, through: :links
  has_many :shelves, as: :categorizable
  has_many :category, through: :shelves


end
