class Category < ActiveRecord::Base
	has_many :sources
	has_many :shelves
end
