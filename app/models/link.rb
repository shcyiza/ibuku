class Link < ActiveRecord::Base
  belongs_to :ideas
  belongs_to :linkable, polymorphic: true
  
end
