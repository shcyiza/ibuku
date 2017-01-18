class Note < ActiveRecord::Base
  belongs_to :source
  belongs_to :user
  has_many :links, as: :linkable
  has_many :ideas, through: :links
  has_many :shelves, as: :categorizable
  has_many :category, through: :shelves
end
