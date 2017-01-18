class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :links
  has_many :shelves, as: :categorizable
  has_many :category, through: :shelves
  has_many :works, through: :links
  has_many :problematics, through: :links


end
