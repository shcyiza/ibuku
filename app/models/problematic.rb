class Problematic < ActiveRecord::Base
  belongs_to :user
  belongs_to :work
  has_many :links ,as: :linkable
  has_many :ideas, through: :links

end
