class Link < ActiveRecord::Base
  belongs_to :idea
  belongs_to :linkable, polymorphic: true

end
