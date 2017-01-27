class Review < ActiveRecord::Base
	belongs_to :origin
	belongs_to :user
end
